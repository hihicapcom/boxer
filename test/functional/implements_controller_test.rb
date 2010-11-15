require 'test_helper'

class ImplementsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:implements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create implement" do
    assert_difference('Implement.count') do
      post :create, :implement => { }
    end

    assert_redirected_to implement_path(assigns(:implement))
  end

  test "should show implement" do
    get :show, :id => implements(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => implements(:one).to_param
    assert_response :success
  end

  test "should update implement" do
    put :update, :id => implements(:one).to_param, :implement => { }
    assert_redirected_to implement_path(assigns(:implement))
  end

  test "should destroy implement" do
    assert_difference('Implement.count', -1) do
      delete :destroy, :id => implements(:one).to_param
    end

    assert_redirected_to implements_path
  end
end
