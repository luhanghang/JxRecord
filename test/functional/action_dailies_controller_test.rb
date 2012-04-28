require 'test_helper'

class ActionDailiesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:action_dailies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create action_daily" do
    assert_difference('ActionDaily.count') do
      post :create, :action_daily => { }
    end

    assert_redirected_to action_daily_path(assigns(:action_daily))
  end

  test "should show action_daily" do
    get :show, :id => action_dailies(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => action_dailies(:one).to_param
    assert_response :success
  end

  test "should update action_daily" do
    put :update, :id => action_dailies(:one).to_param, :action_daily => { }
    assert_redirected_to action_daily_path(assigns(:action_daily))
  end

  test "should destroy action_daily" do
    assert_difference('ActionDaily.count', -1) do
      delete :destroy, :id => action_dailies(:one).to_param
    end

    assert_redirected_to action_dailies_path
  end
end
