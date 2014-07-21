var jobApp = angular.module('job-app', ['ngResource', 'mm.foundation', 'ui.router', 'templates' ]).config(
    ['$httpProvider', function($httpProvider) {
    var authToken = angular.element("meta[name=\"csrf-token\"]").attr("content");
    var defaults = $httpProvider.defaults.headers;

    defaults.common["X-CSRF-TOKEN"] = authToken;
    defaults.patch = defaults.patch || {};
    defaults.patch['Content-Type'] = 'application/json';
    defaults.common['Accept'] = 'application/json';
}]);

jobApp.config(function($stateProvider, $urlRouterProvider) {
  //
  // For any unmatched url, redirect to /state1
  $urlRouterProvider.otherwise("/home");
  //
  // Now set up the states
  $stateProvider
    .state('home', {
      url: "/home",
      templateUrl: "home.html"
    })
    .state('volunteers', {
      url: "/volunteers",
      templateUrl: "volunteers.html"
     })
    .state('jobs', {
      url: "/jobs",
      templateUrl: "jobs.html"
     })
    .state('good_in_numbers', {
      url: "/good_in_numbers",
      templateUrl: "good_in_numbers.html"
     })
    .state('resident_profile', {
      url: "/resident_profile",
      templateUrl: "resident_profile.html"
     })
    .state('update_jobs', {
      url: "/update_jobs",
      templateUrl: "update_jobs.html"
     })
   });

jobApp.factory('Job', ['$resource', function($resource) {
  return $resource('/jobs/:id',
     {id: '@id'},
     {update: { method: 'PATCH'}});
}]);

jobApp.factory('You', ['$resource', function($resource) {
  return $resource('/you/:id',
     {id: '@id'},
     {update: { method: 'PATCH'}});
}]);

jobApp.factory('User', ['$resource', function($resource) {
  return $resource('/users/:id',
     {id: '@id'},
     {update: { method: 'PATCH'}});
}]);


jobApp.controller('JobCtrl', ['$scope','Job', 'You', 'User', function($scope, Job, You, User) {

    $scope.jobs= [];

    $scope.newJob = new Job();

    Job.query(function(jobs) {
      $scope.jobs = jobs;
    });

    You.get(function(you){
      $scope.you = you;
    });

    User.query(function(users) {
      $scope.users = users;
    });

   $scope.editUser = function(you) {
    you.editing = true;
    you.details = false;
   }

   $scope.backUser = function(you) {
      you.editing = false;
      location.reload();
   }

   $scope.updateUser = function(you) {
      you.$update(function() {
        you.editing = false;
      });
    }

    $scope.saveJob = function () {
      $scope.newJob.$save(function(job) {
        $scope.jobs.unshift(job)
        $scope.newJob = new Job();
      });
    }

    $scope.deleteJob = function(job) {
      job.$delete(function() {
        position = $scope.jobs.indexOf(job);
        $scope.jobs.splice(position, 1);
      });
    }

    $scope.showJob = function(job) {
      job.details = true;
      // job.editing = false;
    }

    $scope.hideJob = function(job) {
      job.details = false;
    }

    $scope.editJob = function(job) {
      job.editing = true;
      job.details = false;
    }

    $scope.backJob = function(job) {
      job.details = true;
      job.editing = false;
      location.reload();
    }

    $scope.updateJob = function(job) {
      job.$update(function() {
        job.details = true;
        job.editing = false;
      // }, function(errors) {
      //   $scope.errors = errors.data
      });
    };

    // $scope.clearErrors = function() {
    //   $scope.errors = null;
    // }
}]);

var ModalCtrl = function ($scope, $modal, $log, $state) {

  $scope.jobs = [];

  $scope.open = function () {

    var modalInstance = $modal.open({
      templateUrl: 'myModalContent.html',
      controller: ModalInstanceCtrl
    });

    modalInstance.result.then(function (newJob) {
      newJob.$save(function(job) {
        $state.reload();
      });
    }, function () {
      $log.info('Modal dismissed at: ' + new Date());
    });
  };
};

// Please note that $modalInstance represents a modal window (instance) dependency.
// It is not the same as the $modal service used above.

var ModalInstanceCtrl = function ($scope, $modalInstance, Job) {

   $scope.newJob = new Job();

  $scope.ok = function () {
    $modalInstance.close($scope.newJob);

  };

  $scope.cancel = function () {
    $modalInstance.dismiss('cancel');
  };
};