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
end
