class TodosController < ApplicationController

  def index
    @todos = Todo
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.save
  end

  def toggle
  end

  def toggle_all
  end

  def active
  end

  def completed
  end

  def destroy_completed
  end

  private

    def todo_params
      params.require(:todo).permit(:title, :completed)
    end

end
