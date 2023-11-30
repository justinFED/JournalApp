require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "can create task with name and category" do
    category = Category.create(name: "Vacation")
    task_name = "Get Money"
    task = Task.create(name: task_name, category_id: category.id)

    assert task.persisted?, "valid task"
    assert_equal task_name, task.reload.name
  end

  test "cannot create task with missing details" do
    task = Task.new
    assert_not task.save, "invalid task"
  end

  test "can edit task details" do
    category = Category.create(name: "Work")
    task = Task.create(name: "Complete Project", category_id: category.id)

    new_name = "Update Project Status"
    task.name = new_name
    assert task.save, "edit task details"
    assert_equal new_name, task.reload.name
  end

  test "can view task details" do
    category = Category.create(name: "Work")
    task = Task.create(name: "Complete Project", category_id: category.id)

    expected_details = "Complete Project (Category: Work)"
    assert_equal expected_details, task.details_for_view
  end

  test "can delete a task" do
    category = Category.create(name: "Work")
    task = Task.create(name: "Complete Project", category_id: category.id)

    task_id = task.id
    task.destroy

    assert_nil Task.find_by(id: task_id), "delete a task"
  end

  test "can view tasks for today" do
    category = Category.create(name: "Work")
    task = Task.create(name: "Complete Project", category_id: category.id)

    expected_details = ["Complete Project (Category: Work)"]
    assert_equal expected_details, Task.view_tasks_for_today
  end
end
