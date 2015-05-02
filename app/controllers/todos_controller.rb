class TodosController < ApplicationController
  def index
    @todo = Todo.new
    @todos = Todo.all
  end

  def create
    @todo = Todo.create(todo_params)
    redirect_to root_path
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :task)
  end
end
