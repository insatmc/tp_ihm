require 'test_helper'

class CatagoriesControllerTest < ActionController::TestCase
  setup do
    @catagory = catagories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:catagories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create catagory" do
    assert_difference('Catagorie.count') do
      post :create, catagory: { catogorie_id: @catagory.catogorie_id, label: @catagory.label }
    end

    assert_redirected_to catagory_path(assigns(:catagory))
  end

  test "should show catagory" do
    get :show, id: @catagory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @catagory
    assert_response :success
  end

  test "should update catagory" do
    patch :update, id: @catagory, catagory: { catogorie_id: @catagory.catogorie_id, label: @catagory.label }
    assert_redirected_to catagory_path(assigns(:catagory))
  end

  test "should destroy catagory" do
    assert_difference('Catagorie.count', -1) do
      delete :destroy, id: @catagory
    end

    assert_redirected_to catagories_path
  end
end
