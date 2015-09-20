class TodoItemsController < ApplicationController
  def index
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def new # just create new page GET
    @todo_list = TodoList.find(params[:todo_list_id])
    # create a unsaved object
    @todo_item = @todo_list.todo_items.new
  end

  def create # the page to save object # POST
    @todo_list = TodoList.find(params[:todo_list_id])
    # new ~= create_or_update
    @todo_item = @todo_list.todo_items.new(todo_item_params)

    if @todo_item.save
      flash[:success] = "Added todo list item."
      redirect_to todo_list_todo_items_path
    else
      flash[:error] = "There was a problem adding that todo list item"
      render action: :new
    end
  end

  # edit -> show edit page GET, update -> update object in database POST

  def edit
    @todo_list = TodoList.find(params[:todo_list_id])
    @todo_item = @todo_list.todo_items.find(params[:id])
  end

  def update
    @todo_list = TodoList.find(params[:todo_list_id])
    @todo_item = @todo_list.todo_items.find(params[:id])

    # find original item first, then update it
    if @todo_item.update_attributes(todo_item_params)
      flash[:success] = "Saved todo list item."
      redirect_to todo_list_todo_items_path
    else
      flash[:error] = "There was a problem saving that todo list item"
      render action: :edit
    end
  end

  def url_options
    { todo_list_id: params[:todo_list_id] }.merge(super) # hash.merge(hash)
  end

  private

  def todo_item_params
    params[:todo_item].permit(:content)
  end
end
