require 'spec_helper'

describe Job, :type => :model do
  before {@job = Job.create!(time_preference: "12:00", tools: "Hammer", duration: "1 hour",  type_of_work: "yard work", location: "LA", contact_phone: "8053407031", contact_email: "mikeduval42@gmail.com")}
  subject{@job}

  it { should validates_presence_of(:tools).with_message("One or more of the fields is not completed") }

  it "should return the entered time preference" do
    expect(@job.time_preference).to eq"12:00"
  end



end