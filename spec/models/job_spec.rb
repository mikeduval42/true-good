require 'spec_helper'

describe Job, :type => :model do
  before {@job = Job.create!(time_preference: "12:00AM", tools: "Hammer", recurring:true ,duration: "1 hour",  type_of_work: "yard work", location: "LA", contact_phone: "8053407031", contact_email: "mikeduval42@gmail.com")}
  subject{@job}

it "should return the entered time preference" do
    expect(@job.time_preference).to eq"12:00AM"
  end
it "should return the entered tools needed" do
    expect(@job.tools).to eq"Hammer"
  end
it "should return the value of recurring" do 
	expect(@job.recurring).to eq(true)
  end
it "should return the entered duration of job" do
    expect(@job.duration).to eq"1 hour"
  end
it "should return the entered type of work" do
    expect(@job.type_of_work).to eq"yard work"
  end
it "should return the entered location of resident" do
    expect(@job.location).to eq"LA"
  end
it "should return the entered a phone number" do
    expect(@job.contact_phone).to eq"8053407031"
  end
it "should return the entered an email" do
    expect(@job.contact_email).to eq"mikeduval42@gmail.com"
  end
it "should be valid with all attributes present" do 
	expect(@job).to be_valid
  end

end