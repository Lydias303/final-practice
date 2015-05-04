class TodosController < ApplicationController
  def index
    @todo = Todo.new
    @todos = Todo.all
  end

  def create
    @todo = Todo.create(todo_params)
    redirect_to root_path
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to root_path
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.update_attributes(todo_params)
    redirect_to root_path
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :priority, :finished)
  end
end
