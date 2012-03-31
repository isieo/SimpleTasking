require 'test_helper'

class Columns::AnswersControllerTest < ActionController::TestCase
  setup do
    @columns_answer = columns_answers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:columns_answers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create columns_answer" do
    assert_difference('Columns::Answer.count') do
      post :create, columns_answer: { flag: @columns_answer.flag }
    end

    assert_redirected_to columns_answer_path(assigns(:columns_answer))
  end

  test "should show columns_answer" do
    get :show, id: @columns_answer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @columns_answer
    assert_response :success
  end

  test "should update columns_answer" do
    put :update, id: @columns_answer, columns_answer: { flag: @columns_answer.flag }
    assert_redirected_to columns_answer_path(assigns(:columns_answer))
  end

  test "should destroy columns_answer" do
    assert_difference('Columns::Answer.count', -1) do
      delete :destroy, id: @columns_answer
    end

    assert_redirected_to columns_answers_path
  end
end
