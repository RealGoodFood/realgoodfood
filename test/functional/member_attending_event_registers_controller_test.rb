require 'test_helper'

class MemberAttendingEventRegistersControllerTest < ActionController::TestCase
  setup do
    @member_attending_event_register = member_attending_event_registers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:member_attending_event_registers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create member_attending_event_register" do
    assert_difference('MemberAttendingEventRegister.count') do
      post :create, :member_attending_event_register => @member_attending_event_register.attributes
    end

    assert_redirected_to member_attending_event_register_path(assigns(:member_attending_event_register))
  end

  test "should show member_attending_event_register" do
    get :show, :id => @member_attending_event_register.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @member_attending_event_register.to_param
    assert_response :success
  end

  test "should update member_attending_event_register" do
    put :update, :id => @member_attending_event_register.to_param, :member_attending_event_register => @member_attending_event_register.attributes
    assert_redirected_to member_attending_event_register_path(assigns(:member_attending_event_register))
  end

  test "should destroy member_attending_event_register" do
    assert_difference('MemberAttendingEventRegister.count', -1) do
      delete :destroy, :id => @member_attending_event_register.to_param
    end

    assert_redirected_to member_attending_event_registers_path
  end
end
