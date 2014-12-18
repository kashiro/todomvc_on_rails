require 'rails_helper'

RSpec.describe TodosController, :type => :controller do

  before(:each) do
    @task = FactoryGirl.create(:todo)
    @task_completed = FactoryGirl.create(:todo, :completed)
    request.env["HTTP_ACCEPT"] = "application/javascript"
  end

  describe "GET method" do
    it "should be success" do

      get :index
      expect(response).to be_success

      get :active
      expect(response).to be_success

      get :completed
      expect(response).to be_success
    end
  end

  describe "POST method" do

    it "should be success" do

      post :toggle, :id => @task
      expect(response).to be_success

      post :toggle_all
      expect(response).to be_success

      post :create, todo: {title: "test task"}
      expect(response).to be_success
    end
  end

  describe "DELETE method" do

    it "should be success" do

      delete :destroy_completed
      expect(response).to be_success

      delete :destroy, :id => @task
      expect(response).to be_success
    end
  end

  describe "PUT method" do

    it "should be success" do

      put :update, :id => @task, todo: {title: "test task"}
      expect(response).to be_success
    end
  end

end
