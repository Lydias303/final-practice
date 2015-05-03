require 'rails_helper'

RSpec.describe Api::V1::TodoControllerController, type: :controller do

  describe "GET INDEX" do

    it "responds to json" do
      todo = create(:todo)

      get :index, format: :json

      todos = JSON.parse(response.body)

      first_todo = todos.first

      expect(responds.status).to eq(200)
      expect(first_todo["title"]).too eq(todo.title)
      expect(first_todo["id"]).too eq(todo.id)
    end
  end
end
