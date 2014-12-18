require 'rails_helper'

RSpec.describe TodosController, :type => :controller do

  # 紐づくviewを描画する
  render_views

  before do
    @task = FactoryGirl.create(:todo)
    @task_completed = FactoryGirl.create(:todo, :completed)
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

end
