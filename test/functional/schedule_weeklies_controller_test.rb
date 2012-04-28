require 'test_helper'

class ScheduleWeekliesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedule_weeklies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schedule_weekly" do
    assert_difference('ScheduleWeekly.count') do
      post :create, :schedule_weekly => { }
    end

    assert_redirected_to schedule_weekly_path(assigns(:schedule_weekly))
  end

  test "should show schedule_weekly" do
    get :show, :id => schedule_weeklies(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => schedule_weeklies(:one).to_param
    assert_response :success
  end

  test "should update schedule_weekly" do
    put :update, :id => schedule_weeklies(:one).to_param, :schedule_weekly => { }
    assert_redirected_to schedule_weekly_path(assigns(:schedule_weekly))
  end

  test "should destroy schedule_weekly" do
    assert_difference('ScheduleWeekly.count', -1) do
      delete :destroy, :id => schedule_weeklies(:one).to_param
    end

    assert_redirected_to schedule_weeklies_path
  end
end
