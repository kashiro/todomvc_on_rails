class TodosController < ApplicationController

  # get post以外は_methodパラメータにdelete等メソッドが格納されて
  # 送信されてくるので実際にdeleteやcreateメソッドが叩かれているわけではない

  def index
    @todos = Todo
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.save
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.update(todo_params)
  end

  def toggle
    @todo = Todo.find(params[:id])
    @todo.toggle!(:completed)
  end

  def toggle_all
    # sqlにbooleanはなく、0 or 1 か 文字列のf or tで代用する
    Todo.update_all(completed: params[:completed] ? 't' : 'f')
    @todos = Todo.all
  end

  def active
    @todos = Todo.active
    set_current_filter(:active)
    render :index
  end

  def completed
    @todos = Todo.completed
    set_current_filter(:completed)
    render :index
  end

  def destroy_completed
    @todos_for_destruction = Todo.completed.all

    # 先にレンダリングさせておかないと、viewで参照する@todos_for_destructionの中身が空になってしまう
    render "destroy_completed"

    Todo.completed.destroy_all
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
  end

  private

    def todo_params
      params.require(:todo).permit(:title, :completed)
    end

    def set_current_filter(filter)
      @current_filter = filter
    end

    def current_filter
      @current_filter
    end

end
