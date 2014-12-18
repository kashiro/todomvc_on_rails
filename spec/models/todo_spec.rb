require 'rails_helper'

RSpec.describe Todo, :type => :model do

  before do
    @todo = FactoryGirl.create(:todo)
  end

  subject { @todo }

  it { should respond_to :title }
  it { should respond_to :completed }
  it { should be_valid }

	# ------------------------------
	# title
	# ------------------------------
  describe "title is not presence" do
    before { @todo.title = "" }
    it { should_not be_valid }
  end
  describe "title is too long" do
    before { @todo.title = "a" * 51 }
    it { should_not be_valid }
  end
end
