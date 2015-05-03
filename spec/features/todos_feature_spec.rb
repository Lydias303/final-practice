require 'rails_helper'

describe "todos index", :type => :feature do
  before :each do
    todo = create(:todo)
  end

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
    visit '/'
    expect(page).to have_content ("Grocery Shopping")
    click_button 'Delete'
    expect(page).to_not have_content 'Go Shopping'
  end

  it "goes to a edit show page for a todo " do
    visit '/'
    within(".todos") do
      click_button 'Edit'
    end
    expect(current_path).to eq(todo.id/edit)
  end
end
