require 'rails_helper'

RSpec.describe TodosController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "can create a new todo" do
      post :create, todo: { title: "Work out", task: "go to yoga at 5pm"}

      assert_redirected_to root_path
      expect(Todo.count).to eq(1)
    end
  end

  describe "DELETE" do
    it "can delete a todo" do
      todo = create(:todo)
      expect(Todo.count).to eq(1)
      delete :destroy, id: todo.id

      assert_redirected_to root_path
      expect(Todo.count).to eq(0)
    end
  end


    describe "PUT #update" do
      it "can delete a todo" do
        todo = create(:todo)
        expect(Todo.count).to eq(1)
        expect(todo.title).to eq("Grocery Shopping")
        put :update, id: todo.id, todo: {title: "Clean up", task: "do laundry"}

        assert_redirected_to root_path
        expect(todo.title).to eq("Clean up")
        expect(todo.task).to eq("do laundry")
      end
    end
end
