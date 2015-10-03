require "spec_helper"

describe "Adding todo items" do
  let!(:todo_list) { TodoList.create(title: "defaultTitleForTest", description: "defaultDescriptionForTest") }

  def visit_todo_list_and_click_save(list, content)
    visit_todo_list(list)

    click_link "New Todo item"
    fill_in "Content", with: content
    click_button "Save"
  end

  it "is successfully with valid content" do
    visit_todo_list_and_click_save(todo_list, "defaultContentForTest")

    expect(page).to have_content("Added todo list item.")

    within("ul.todo_items") do
      expect(page).to have_content("defaultContentForTest")
    end
  end

  it "displays an error with no content" do
    visit_todo_list_and_click_save(todo_list, "")

    within("div.flash") do
      expect(page).to have_content("There was a problem adding that todo list item")
    end

    expect(page).to have_content("Content can't be blank")
  end

  it "displays an error with content less than 2 characters long" do
    visit_todo_list_and_click_save(todo_list, "1")

    within("div.flash") do
      expect(page).to have_content("There was a problem adding that todo list item")
    end

    expect(page).to have_content("Content is too short")
  end
end
