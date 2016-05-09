require 'test_helper'

class StyleInteractionsControllerTest < ActionController::TestCase
  setup do
    @style_interaction = style_interactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:style_interactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create style_interaction" do
    assert_difference('StyleInteraction.count') do
      post :create, style_interaction: { label: @style_interaction.label }
    end

    assert_redirected_to style_interaction_path(assigns(:style_interaction))
  end

  test "should show style_interaction" do
    get :show, id: @style_interaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @style_interaction
    assert_response :success
  end

  test "should update style_interaction" do
    patch :update, id: @style_interaction, style_interaction: { label: @style_interaction.label }
    assert_redirected_to style_interaction_path(assigns(:style_interaction))
  end

  test "should destroy style_interaction" do
    assert_difference('StyleInteraction.count', -1) do
      delete :destroy, id: @style_interaction
    end

    assert_redirected_to style_interactions_path
  end
end
