require 'spec_helper'

describe JobsController do
  let(:valid_attributes) {{
    # :id => 1,
    :time_preference => "11:11",
    :tools => "hammer",
    :type_of_work => "yardwork",
    :duration => "1 hour",
    :recurring => true,
    :location => "LA",
    :contact_phone => "8053407031",
    :contact_email => "test@test.com",
    :created_at => "2014-06-24T01:24:55.399Z",
    :user_id => 1
    }}

  describe "GET index" do
    before do
      @job1 = Job.create! valid_attributes
      get :index
    end

    it "should succeed" do
      expect(response).to be_success
      end

    it "should render the index template" do
      expect(response).to render_template :index
      end

    it "should assign jobs to all jobs" do
      expect(assigns(:jobs)).to eq([@job1])
      end
  end

  describe "GET show" do
    before do
      @job = Job.create! valid_attributes
      get :show, id: @job.id
    end

    it "should render the index template" do
      expect(response).to render_template :show
    end

    it "should succeed" do
      expect(response).to be_success
    end

    it "should assign jobs to all jobs" do
      expect(assigns(:job)).to eq(@job)
    end
  end

  describe "GET new" do
    before do
      get :new
    end

    it "should render the new template" do
      expect(response).to render_template :new
    end

    it "should succeed" do
      expect(response).to be_success
    end

    it "should assign a new job" do
      expect(assigns(:job)).to be_a(Job)
      expect(assigns(:job)).to_not be_persisted
    end
  end

  describe "GET edit" do
    before do
      @job = Job.create! valid_attributes
      get :edit, id: @job.id
    end

    it "should render the index template" do
      expect(response).to render_template :edit
    end

    it "should succeed" do
      expect(response).to be_success
    end

    it "should assign jobs to all jobs" do
      expect(assigns(:job)).to eq(@job)
    end
  end
end
