require 'test_helper'

class Checklist::TasksControllerTest < ActionController::TestCase
  setup do
    @checklist_task = checklist_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:checklist_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create checklist_task" do
    assert_difference('Checklist::Task.count') do
      post :create, checklist_task: { description: @checklist_task.description, name: @checklist_task.name }
    end

    assert_redirected_to checklist_task_path(assigns(:checklist_task))
  end

  test "should show checklist_task" do
    get :show, id: @checklist_task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @checklist_task
    assert_response :success
  end

  test "should update checklist_task" do
    put :update, id: @checklist_task, checklist_task: { description: @checklist_task.description, name: @checklist_task.name }
    assert_redirected_to checklist_task_path(assigns(:checklist_task))
  end

  test "should destroy checklist_task" do
    assert_difference('Checklist::Task.count', -1) do
      delete :destroy, id: @checklist_task
    end

    assert_redirected_to checklist_tasks_path
  end
end
