require 'spec_helper'

describe User, :type => :model do
  before {@user = User.create!(name: "mike", email: 'miked@mike.com', password:'mike', resident:true, volunteer:false, corporation:false, phone_number: '8675309', reference:true, reference_contact:'8675309', address:'5509 Arvada St', city:'Encino', state:'CA', zip:'90503', background_check:true)}
  subject{@user}

it "should return the entered name" do
    expect(@user.name).to eq"mike"
  end
it "should return the entered email" do
    expect(@user.email).to eq"miked@mike.com"
  end
it "should return the entered password" do
    expect(@user.password).to eq"mike"
  end
it "should return true if a resident" do
    expect(@user.resident).to eq(true)
  end
it "should return true if a volunteer" do
    expect(@user.volunteer).to eq(false)
  end
it "should return true if a corporation" do
    expect(@user.corporation).to eq(false)
  end
it "should return the entered a phone number" do
    expect(@user.phone_number).to eq"8675309"
  end
it "should return true if a reference" do
    expect(@user.reference).to eq(true)
  end
it "should return the reference contact number" do
    expect(@user.reference_contact).to eq"8675309"
  end
it "should return the entered address" do
    expect(@user.address).to eq"5509 Arvada St"
  end
it "should return the entered city" do
    expect(@user.city).to eq"Encino"
  end
it "should return the entered state" do
    expect(@user.state).to eq"CA"
  end
it "should return the entered zip code" do
    expect(@user.zip).to eq"90503"
  end
it "should return true if background check is present" do
    expect(@user.background_check).to eq(true)
  end
it "validates the user with all attributes present" do
  expect(@user).to be_valid
  end


end