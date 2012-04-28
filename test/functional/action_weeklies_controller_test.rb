require 'test_helper'

class ActionWeekliesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:action_weeklies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create action_weekly" do
    assert_difference('ActionWeekly.count') do
      post :create, :action_weekly => { }
    end

    assert_redirected_to action_weekly_path(assigns(:action_weekly))
  end

  test "should show action_weekly" do
    get :show, :id => action_weeklies(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => action_weeklies(:one).to_param
    assert_response :success
  end

  test "should update action_weekly" do
    put :update, :id => action_weeklies(:one).to_param, :action_weekly => { }
    assert_redirected_to action_weekly_path(assigns(:action_weekly))
  end

  test "should destroy action_weekly" do
    assert_difference('ActionWeekly.count', -1) do
      delete :destroy, :id => action_weeklies(:one).to_param
    end

    assert_redirected_to action_weeklies_path
  end
end
