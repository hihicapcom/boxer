require 'test_helper'

class ModulesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:modules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create module" do
    assert_difference('Module.count') do
      post :create, :module => { }
    end

    assert_redirected_to module_path(assigns(:module))
  end

  test "should show module" do
    get :show, :id => modules(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => modules(:one).to_param
    assert_response :success
  end

  test "should update module" do
    put :update, :id => modules(:one).to_param, :module => { }
    assert_redirected_to module_path(assigns(:module))
  end

  test "should destroy module" do
    assert_difference('Module.count', -1) do
      delete :destroy, :id => modules(:one).to_param
    end

    assert_redirected_to modules_path
  end
end
