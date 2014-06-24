require 'spec_helper'

describe UsersController do
  let(:valid_attributes) {{
    :email => "test@test.com",
    :password => "12345",
    :password => "test",
    :resident => true,
    :volunteer => false,
    :corporation => false,
    :phone_number => "8053407031",
    :reference => true,
    :reference_contact => "Mike",
    :address => "123 apple",
    :city => "LA",
    :state => "CA",
    :zip => "91316",
    :background_check => false
    }}

  describe "GET new" do
    before {get :new}
    it "returns http success" do
      get 'new'
      response.should be_success
    end

    it "should succeed" do
    expect(response).to be_success
    end
end

  describe "POST create" do

    it "should redirect to the index action when create fails" do
      post :create, user: valid_attributes
      expect(response).to redirect_to 'new'
      end

    describe "not able to save" do
      let(:invalid_attributes) {{
      :email => nil }}

    it "should not save new user to database" do
      expect {post :create, user: invalid_attributes}.to_not change(User, :count).by(1)
     end
    end
  end
end