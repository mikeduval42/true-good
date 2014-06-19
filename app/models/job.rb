class Job < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :time_preference, :tools, :duration, :type_of_work, :location, :contact_phone, :contact_email, message: "One or more of the fields is not completed"
end
