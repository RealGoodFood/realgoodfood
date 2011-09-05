require 'test_helper'

class EatByDatesControllerTest < ActionController::TestCase
  setup do
    @eat_by_date = eat_by_dates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:eat_by_dates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create eat_by_date" do
    assert_difference('EatByDate.count') do
      post :create, :eat_by_date => @eat_by_date.attributes
    end

    assert_redirected_to eat_by_date_path(assigns(:eat_by_date))
  end

  test "should show eat_by_date" do
    get :show, :id => @eat_by_date.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @eat_by_date.to_param
    assert_response :success
  end

  test "should update eat_by_date" do
    put :update, :id => @eat_by_date.to_param, :eat_by_date => @eat_by_date.attributes
    assert_redirected_to eat_by_date_path(assigns(:eat_by_date))
  end

  test "should destroy eat_by_date" do
    assert_difference('EatByDate.count', -1) do
      delete :destroy, :id => @eat_by_date.to_param
    end

    assert_redirected_to eat_by_dates_path
  end
end
