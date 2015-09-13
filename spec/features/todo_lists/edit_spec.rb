require "spec_helper"

describe "Editing todo lists" do
    let!(:todo_list) { TodoList.create(title: "aTitle", description: "aDescription") } # !(side-effect) global static, initialize only once

    def update_todo_list(options={})
        options[:title] ||= "new title"
        options[:description] ||= "new description"

        todo_list = options[:todo_list]

        visit "/todo_lists"
        within "#todo_list_#{todo_list.id}" do # get td=correct id
            click_link "Edit"
        end

        fill_in "Title", with: options[:title]
        fill_in "Description", with: options[:description]
        click_button "Update Todo list"
    end

    it "updates a todo list successfully with correct information" do
        update_todo_list todo_list: todo_list

        todo_list.reload # refresh todo_list object in memory

        expect(page).to have_content("Todo list was successfully updated")
        expect(todo_list.title).to eq("new title")
        expect(todo_list.description).to eq("new description")
    end

    it "updating a todo list with no title displays an error" do
        update_todo_list todo_list: todo_list, title: ""

        todo_list.reload
        expect(todo_list.title).to eq("aTitle")
        expect(todo_list.description).to eq("aDescription")

        expect(page).to have_content("error")
    end

    it "updating a todo list with too short title displays an error" do
        update_todo_list todo_list: todo_list, title: "12"

        todo_list.reload
        expect(todo_list.title).to eq("aTitle")
        expect(todo_list.description).to eq("aDescription")

        expect(page).to have_content("error")
    end

    it "updating a todo list with no description displays an error" do
        update_todo_list todo_list: todo_list, description: ""

        todo_list.reload
        expect(todo_list.title).to eq("aTitle")
        expect(todo_list.description).to eq("aDescription")

        expect(page).to have_content("error")
    end

    it "updating a todo list with too short description displays an error" do
        update_todo_list todo_list: todo_list, description: "1234"

        todo_list.reload
        expect(todo_list.title).to eq("aTitle")
        expect(todo_list.description).to eq("aDescription")

        expect(page).to have_content("error")
    end
end
