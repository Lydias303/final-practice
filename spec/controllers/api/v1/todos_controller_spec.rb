require 'rails_helper'

RSpec.describe Api::V1::TodosController, type: :controller do

  describe "GET INDEX" do

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

  describe "GET SHOW" do

    it "responds to json in the show" do
      todo = create(:todo)

      get :show, id: todo.id, format: :json

      parsed_todo = todo.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_todo["title"]).to eq(todo.title)
      expect(parsed_todo["id"]).to eq(todo.id)
    end
  end
end
