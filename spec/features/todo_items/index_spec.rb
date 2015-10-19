require "spec_helper"

describe "Viewing todo items" do
    let!(:todo_list) { TodoList.create(title: "defaultTitleForTest", description: "defaultDescriptionForTest") }

    # before do
    #     visit "/todo_lists"
    #     within "#todo_list_#{todo_list.id}" do
    #         click_link "List Items"
    #     end
    # end

    it "displays the title of the todo list" do
        visit_todo_list todo_list

        within("div.content h1") do
            expect(page).to have_content(todo_list.title)
        end
    end

    it "displays no items when a todo list is empty" do
        visit_todo_list todo_list

        expect(page.all("ul.todo_items li").size).to eq(0)
    end

    it "displays items when a todo list has items" do
        todo_list.todo_items.create(content: "TestContent01")
        todo_list.todo_items.create(content: "TestContent02")

        visit_todo_list todo_list

        expect(page.all("table.todo_items tbody tr").size).to eq(2)

        within "table.todo_items" do
            expect(page).to have_content("TestContent01")
            expect(page).to have_content("TestContent02")
        end
    end
end
