require 'test_helper'

class CriteresControllerTest < ActionController::TestCase
  setup do
    @critere = criteres(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:criteres)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create critere" do
    assert_difference('Critere.count') do
      post :create, critere: { auteur_id: @critere.auteur_id, catogrie_id: @critere.catogrie_id, label: @critere.label }
    end

    assert_redirected_to critere_path(assigns(:critere))
  end

  test "should show critere" do
    get :show, id: @critere
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @critere
    assert_response :success
  end

  test "should update critere" do
    patch :update, id: @critere, critere: { auteur_id: @critere.auteur_id, catogrie_id: @critere.catogrie_id, label: @critere.label }
    assert_redirected_to critere_path(assigns(:critere))
  end

  test "should destroy critere" do
    assert_difference('Critere.count', -1) do
      delete :destroy, id: @critere
    end

    assert_redirected_to criteres_path
  end
end
