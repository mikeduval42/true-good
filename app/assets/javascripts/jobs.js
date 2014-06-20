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
  $urlRouterProvider.otherwise("/jobs");
  //
  // Now set up the states
  $stateProvider
    .state('jobs', {
      url: "/jobs",
      templateUrl: "jobs.html"
    })
    .state('volunteers', {
      url: "/volunteers",
      templateUrl: "volunteers.html"
     })
    .state('home', {
      url: "/home",
      templateUrl: "home.html"
     })
    .state('good_in_numbers', {
      url: "/good_in_numbers",
      templateUrl: "good_in_numbers.html"
     })
    .state('resident_profile', {
      url: "/resident_profile",
      templateUrl: "resident_profile.html"
     })
    .state('volunteer_profile', {
      url: "/volunteer_profile",
      templateUrl: "volunteer_profile.html"
     })
    .state('corporation_profile', {
      url: "/corporation_profile",
      templateUrl: "corporation_profile.html"
     })
   });

jobApp.factory('Job', ['$resource', function($resource) {
  return $resource('/jobs/:id',
     {id: '@id'},
     {update: { method: 'PATCH'}});
}]);

jobApp.controller('JobCtrl', ['$scope', 'Job', function($scope, Job) {
    $scope.jobs= [];

    $scope.newJob = new Job();

    // $scope.aside = {
    //   "title": "GA Sidebar",
    //   "content": "Hello GA STUDENTS!!<br />This is a multiline message!"
    // };

    Job.query(function(jobs) {
      $scope.jobs = jobs;
   });

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
      job.editing = false;
    }

    $scope.updateJob   = function(job) {
      job.$update(function() {
        job.editing = false;
      // }, function(errors) {
      //   $scope.errors = errors.data
      });
    };

    // $scope.clearErrors = function() {
    //   $scope.errors = null;
    // }
}]);