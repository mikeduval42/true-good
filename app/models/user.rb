class User < ActiveRecord::Base
  has_many :jobs
  validates_presence_of :name, :email, :password, :phone_number, :reference_contact, :address, :city, :state, :zip
end
