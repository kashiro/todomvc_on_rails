require 'rails_helper'

feature "Todos", :type => :feature do

  feature "get /" do

    scenario "should show all todos" do
      visit '/'
      list = get_todo_list page, "all"
      expect(list.length).to eq(0)

      # add task
      FactoryGirl.create_list(:todo, 2)
      FactoryGirl.create_list(:todo, 3, :completed)
      visit '/'
      list = get_todo_list page, "all"
      expect(list.size).to eq(5)
    end

  end

  feature "get /todos/active" do

    scenario "should show only active todo" do
      FactoryGirl.create_list(:todo, 2)
      FactoryGirl.create_list(:todo, 3, :completed)
      visit '/todos/active'
      list = get_todo_list page, "active"
      expect(list.size).to eq(2)
    end

  end

  feature "get /todos/completed" do

    scenario "should show only completed todo" do
      FactoryGirl.create_list(:todo, 2)
      FactoryGirl.create_list(:todo, 3, :completed)
      visit '/todos/completed'
      list = get_todo_list page, "completed"
      expect(list.size).to eq(3)
    end

  end

  feature "post /todos/toggle" do

    scenario "should toggled todo's attribute in html" do
      # You should test this case using Javascript test framework
    end

  end

  feature "post /todos/toggle_all" do

    scenario "should toggled all todo's attribute in html" do
      # You should test this case using Javascript test framework
    end

  end

  feature "post /todos" do

    scenario "should create new todo in html" do
      # You should test this case using Javascript test framework
    end

  end

  feature "put /todos/:id" do

    scenario "should update todo's attribute in html" do
      # You should test this case using Javascript test framework
    end

  end

  feature "delete /todos/destroy_completed" do

    scenario "should delete all todos in html" do
      # You should test this case using Javascript test framework
    end

  end

  feature "delete /todos/destroy" do

    scenario "should delete a todo in html" do
      # You should test this case using Javascript test framework
    end

  end


  def get_todo_list(page, filter)

    cls_filter = ""
    if(filter == "active") then
      cls_filter = ":not(.completed)"
    elsif(filter == "completed") then
      cls_filter = ".completed"
    else
      cls_filter = ""
    end
    page.all("#todo-list li#{cls_filter}")
  end

end
