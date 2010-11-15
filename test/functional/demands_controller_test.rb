require 'test_helper'

class DemandsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:demands)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create demand" do
    assert_difference('Demand.count') do
      post :create, :demand => { }
    end

    assert_redirected_to demand_path(assigns(:demand))
  end

  test "should show demand" do
    get :show, :id => demands(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => demands(:one).to_param
    assert_response :success
  end

  test "should update demand" do
    put :update, :id => demands(:one).to_param, :demand => { }
    assert_redirected_to demand_path(assigns(:demand))
  end

  test "should destroy demand" do
    assert_difference('Demand.count', -1) do
      delete :destroy, :id => demands(:one).to_param
    end

    assert_redirected_to demands_path
  end
end
