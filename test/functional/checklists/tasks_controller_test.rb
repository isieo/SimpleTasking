require 'test_helper'

class Checklists::TasksControllerTest < ActionController::TestCase
  setup do
    @checklists_task = checklists_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:checklists_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create checklists_task" do
    assert_difference('Checklists::Task.count') do
      post :create, checklists_task: { description: @checklists_task.description, name: @checklists_task.name }
    end

    assert_redirected_to checklists_task_path(assigns(:checklists_task))
  end

  test "should show checklists_task" do
    get :show, id: @checklists_task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @checklists_task
    assert_response :success
  end

  test "should update checklists_task" do
    put :update, id: @checklists_task, checklists_task: { description: @checklists_task.description, name: @checklists_task.name }
    assert_redirected_to checklists_task_path(assigns(:checklists_task))
  end

  test "should destroy checklists_task" do
    assert_difference('Checklists::Task.count', -1) do
      delete :destroy, id: @checklists_task
    end

    assert_redirected_to checklists_tasks_path
  end
end
