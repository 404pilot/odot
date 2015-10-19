require 'spec_helper'

describe TodoList do
  let(:todo_list) { TodoList.create(title: "defaultTitleForTest", description: "defaultDescriptionForTest") }

  it { should have_many(:todo_items) }

  describe "#has_completed_items" do
    it 'should return true with completed todo list items' do
      todo_list.todo_items.create(content: 'defaultContentForTest', completed_at: 5.minutes.ago)

      expect(todo_list.has_completed_items?).to be_true
    end

    it 'should return false with no completed todo list items' do
      todo_list.todo_items.create(content: 'defaultContentForTest')

      expect(todo_list.has_completed_items?).to be_false
    end
  end

  describe "#has_incompleted_items" do
    it 'should return false with completed todo list items' do
      todo_list.todo_items.create(content: 'defaultContentForTest', completed_at: 5.minutes.ago)

      expect(todo_list.has_incompleted_items?).to be_false
    end

    it 'should return true with no completed todo list items' do
      todo_list.todo_items.create(content: 'defaultContentForTest')

      expect(todo_list.has_incompleted_items?).to be_true
    end
  end
end
