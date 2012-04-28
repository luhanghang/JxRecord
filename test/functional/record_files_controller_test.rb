require 'test_helper'

class RecordFilesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:record_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create record_file" do
    assert_difference('RecordFile.count') do
      post :create, :record_file => { }
    end

    assert_redirected_to record_file_path(assigns(:record_file))
  end

  test "should show record_file" do
    get :show, :id => record_files(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => record_files(:one).to_param
    assert_response :success
  end

  test "should update record_file" do
    put :update, :id => record_files(:one).to_param, :record_file => { }
    assert_redirected_to record_file_path(assigns(:record_file))
  end

  test "should destroy record_file" do
    assert_difference('RecordFile.count', -1) do
      delete :destroy, :id => record_files(:one).to_param
    end

    assert_redirected_to record_files_path
  end
end
