require 'rails_helper'

RSpec.describe Api::V1::TodosController, type: :controller do

  describe "GET #INDEX" do

    it "responds to json" do
      todo = create(:todo)

      get :index, format: :json

      todos = JSON.parse(response.body)

      first_todo = todos.first

      expect(response.status).to eq(200)
      expect(first_todo["title"]).to eq(todo.title)
      expect(first_todo["id"]).to eq(todo.id)
    end
  end

  describe "GET #SHOW" do

    it "responds to json in the show" do
      todo = create(:todo)

      get :show, id: todo.id, format: :json

      parsed_todo = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_todo["title"]).to eq(todo.title)
      expect(parsed_todo["id"]).to eq(todo.id)
    end
  end

  describe "POST #CREATE" do
    it "can create a new todo in json" do
      todo = {format: :json, todo: {title: "Homework", task: "Read to Voltaire"}}
      post :create, todo

      expect(Todo.count).to eq(1)
      expect(response.body).to include("Homework")
    end
  end

  describe "PUT #UPDATE" do
    it "can update a todo" do
      todo = create(:todo)
      params = { title: "Keep in Touch", task: "Email Sarah"}

      put :update, todo: params, id: todo.id

      expect(response.status).to eq(200)

      updated_todo = JSON.parse(response.body)

      expect(updated_todo["title"]).to eq("Keep in Touch")
      expect(updated_todo["task"]).to eq("Email Sarah")
      expect(todo["id"]).to eq(updated_todo["id"])
    end
  end

  describe "DELETE #DESTROY" do
    it "can delete a todo" do
      todo = create(:todo)
      expect(Todo.count).to eq(1)

      delete :destroy, id: todo.id

      expect(response.status).to eq(200)
      expect(Todo.count).to eq(0)
    end
  end
end
