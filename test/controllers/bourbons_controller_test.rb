require 'test_helper'

class BourbonsControllerTest < ActionController::TestCase
  setup do
    @bourbon = bourbons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bourbons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bourbon" do
    assert_difference('Bourbon.count') do
      post :create, bourbon: { alcohol: @bourbon.alcohol, buttery: @bourbon.buttery, char: @bourbon.char, citrus_fruit: @bourbon.citrus_fruit, corny: @bourbon.corny, dark_fruit: @bourbon.dark_fruit, description: @bourbon.description, floral: @bourbon.floral, grainy: @bourbon.grainy, heat: @bourbon.heat, herbal: @bourbon.herbal, image: @bourbon.image, malty: @bourbon.malty, name: @bourbon.name, spicy: @bourbon.spicy, sweet: @bourbon.sweet, tannic: @bourbon.tannic, toffee: @bourbon.toffee, vanilla: @bourbon.vanilla, woody: @bourbon.woody }
    end

    assert_redirected_to bourbon_path(assigns(:bourbon))
  end

  test "should show bourbon" do
    get :show, id: @bourbon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bourbon
    assert_response :success
  end

  test "should update bourbon" do
    patch :update, id: @bourbon, bourbon: { alcohol: @bourbon.alcohol, buttery: @bourbon.buttery, char: @bourbon.char, citrus_fruit: @bourbon.citrus_fruit, corny: @bourbon.corny, dark_fruit: @bourbon.dark_fruit, description: @bourbon.description, floral: @bourbon.floral, grainy: @bourbon.grainy, heat: @bourbon.heat, herbal: @bourbon.herbal, image: @bourbon.image, malty: @bourbon.malty, name: @bourbon.name, spicy: @bourbon.spicy, sweet: @bourbon.sweet, tannic: @bourbon.tannic, toffee: @bourbon.toffee, vanilla: @bourbon.vanilla, woody: @bourbon.woody }
    assert_redirected_to bourbon_path(assigns(:bourbon))
  end

  test "should destroy bourbon" do
    assert_difference('Bourbon.count', -1) do
      delete :destroy, id: @bourbon
    end

    assert_redirected_to bourbons_path
  end
end
