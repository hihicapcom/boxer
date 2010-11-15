require 'test_helper'

class ParticipatesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:participates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create participate" do
    assert_difference('Participate.count') do
      post :create, :participate => { }
    end

    assert_redirected_to participate_path(assigns(:participate))
  end

  test "should show participate" do
    get :show, :id => participates(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => participates(:one).to_param
    assert_response :success
  end

  test "should update participate" do
    put :update, :id => participates(:one).to_param, :participate => { }
    assert_redirected_to participate_path(assigns(:participate))
  end

  test "should destroy participate" do
    assert_difference('Participate.count', -1) do
      delete :destroy, :id => participates(:one).to_param
    end

    assert_redirected_to participates_path
  end
end
