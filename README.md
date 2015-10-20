## 00 Preset

```
$ gem install bundler
$ gem install sqlite3
$ gem install rails
```

## 01 Generate a Rails Application/

```
$ rails new odot

$ bin/rails server
```

## 02 Set up Git and Add Gems
```
# rebuild libraries
$ bundle

$ bin/rails generate rspec:install

$ bundle binstubs rspec-core
```

## 03 Generate a Scaffold/
```
# http://localhost:3000/todo_lists
$ bin/rails generate scaffold todo_list title:string description:text

# guess this only apply development environment
$ bin/rake db:migrate

$ bin/rake db:migrate RAILS_ENV=test
```

## 04 Write Our First Tests
```
$ bin/rake spec

$ mkdir -p spec/features/todo_lists

$ bin/rspec spec/features/todo_lists/create_spec.rb
```

## 05 Validating Length
## 06 Creating Methods in Tests
## 07 Editing Todo Lists
## 08 Deleting Todo Lists
## 09 Relationships
```
# re-sync gems
$ bundle # re-sync

# -p pretend to do something
$ bin/rails generate model todo_item todo_list:references content:string -p

$ bin/rails generate model todo_item todo_list:references content:string

$ bin/rake db:migrate

$ bin/rake db:migrate RAILS_ENV=test
```

## 10 Viewing Todo Items (part 1)
```
$ bin/rails generate controller todo_items index -p

$ bin/rails generate controller todo_items index

$ bin/rake routes
```

## 11 Viewing Todo Items (part 2)
```
$ bin/rspec --format=documentation spec/features/todo_items/index_spec.rb
```

## 12 Adding Todo Items
## 13 Adding Validations to Todo Items
## 14 Editing Todo Items

## 15 Cleaning Up Our Code
```
before_action :find_todo_list

# equivalent to
before_action(:find_todo_list)
```

pass method name and rails will call the method by the **name**

## 16 Deleting Todo Items
```
treehouse:~/projects/odot (16_Deleting_Todo_Items) $ rake routes
                  Prefix Verb   URI Pattern                                             Controller#Action
    todo_list_todo_items GET    /todo_lists/:todo_list_id/todo_items(.:format)          todo_items#index
                         POST   /todo_lists/:todo_list_id/todo_items(.:format)          todo_items#create
 new_todo_list_todo_item GET    /todo_lists/:todo_list_id/todo_items/new(.:format)      todo_items#new
edit_todo_list_todo_item GET    /todo_lists/:todo_list_id/todo_items/:id/edit(.:format) todo_items#edit
     todo_list_todo_item GET    /todo_lists/:todo_list_id/todo_items/:id(.:format)      todo_items#show
                         PATCH  /todo_lists/:todo_list_id/todo_items/:id(.:format)      todo_items#update
                         PUT    /todo_lists/:todo_list_id/todo_items/:id(.:format)      todo_items#update
                         DELETE /todo_lists/:todo_list_id/todo_items/:id(.:format)      todo_items#destroy
```

```
<%= link_to "Delete", todo_list_todo_item_path(todo_item), method: :delete,
      data: { confirm: "Are you sure?"} %>
```


## 17 Writing Test Helpers

```
# spec_helper.rb:14
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
```

## 18 Marking Todo Items Complete

```
# generate AddCompletedAtTOTOdoItems.rb
$ bin/rails generate migration add_completed_at_to_todo_items

# add_column
...

$ bin/rake db:migrate
$ bin/rake db:migrate RAILS_ENV=test
```

## 19 Cleaning Up Our View

## 20 Viewing Todo Lists



## Notes
1. `controller.new`: to show page to create
2. `controller.create`: to create a record in database
3. `model.new`: ~= create_or_update, will save in cache somehow


