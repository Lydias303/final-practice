require 'rails_helper'

describe "todos index", :type => :feature do

  it "creates a new todo " do
    visit '/'
    within(".todos") do
      fill_in 'todo[title]', :with => 'Read'
      fill_in 'todo[task]', :with => 'Eloquent Javascript'
    end
    click_button 'Create Todo'
    expect(page).to have_content 'Read'
    expect(page).to have_content 'Eloquent Javascript'
  end

  it "deletes a new todo " do
    todo = create(:todo)
    visit '/'
    expect(page).to have_content ("Grocery Shopping")
    click_button 'Delete'
    expect(page).to_not have_content 'Go Shopping'
  end

  it "updates a todo " do
    todo = create(:todo)
    visit '/'
    within(".todos") do
      click_button 'Edit'
    end
    expect(current_path).to eq(edit_todo_path(todo.id))
    within(".edit-todo") do
      fill_in 'todo[title]', :with => 'Errands'
      fill_in 'todo[task]', :with => 'Go to post office.'
      click_button 'Update Todo'
    end
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Errands")
    expect(page).to have_content("Go to post office.")
    expect(page).to_not have_content("Grocery Shopping")
  end
end
