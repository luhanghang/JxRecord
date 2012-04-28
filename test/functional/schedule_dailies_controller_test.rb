require 'test_helper'

class ScheduleDailiesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedule_dailies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schedule_daily" do
    assert_difference('ScheduleDaily.count') do
      post :create, :schedule_daily => { }
    end

    assert_redirected_to schedule_daily_path(assigns(:schedule_daily))
  end

  test "should show schedule_daily" do
    get :show, :id => schedule_dailies(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => schedule_dailies(:one).to_param
    assert_response :success
  end

  test "should update schedule_daily" do
    put :update, :id => schedule_dailies(:one).to_param, :schedule_daily => { }
    assert_redirected_to schedule_daily_path(assigns(:schedule_daily))
  end

  test "should destroy schedule_daily" do
    assert_difference('ScheduleDaily.count', -1) do
      delete :destroy, :id => schedule_dailies(:one).to_param
    end

    assert_redirected_to schedule_dailies_path
  end
end
