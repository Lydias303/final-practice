class Api::V1::TodosController < ApplicationController
  respond_to :json

  def index
    @todos = Todo.all
    respond_with @todos
  end

  def show
    @todo = Todo.find(params[:id])
    respond_with @todo
  end

  def create
    @todo = Todo.create(todo_params)
    respond_with @todo
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :task)
  end
end
