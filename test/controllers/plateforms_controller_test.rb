require 'test_helper'

class PlateformsControllerTest < ActionController::TestCase
  setup do
    @plateform = plateforms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plateforms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plateform" do
    assert_difference('Plateform.count') do
      post :create, plateform: { label: @plateform.label }
    end

    assert_redirected_to plateform_path(assigns(:plateform))
  end

  test "should show plateform" do
    get :show, id: @plateform
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plateform
    assert_response :success
  end

  test "should update plateform" do
    patch :update, id: @plateform, plateform: { label: @plateform.label }
    assert_redirected_to plateform_path(assigns(:plateform))
  end

  test "should destroy plateform" do
    assert_difference('Plateform.count', -1) do
      delete :destroy, id: @plateform
    end

    assert_redirected_to plateforms_path
  end
end
