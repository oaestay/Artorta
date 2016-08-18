require 'test_helper'

class WeddingToppingsControllerTest < ActionController::TestCase
  setup do
    @wedding_topping = wedding_toppings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wedding_toppings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wedding_topping" do
    assert_difference('WeddingTopping.count') do
      post :create, wedding_topping: { code: @wedding_topping.code, name: @wedding_topping.name, popularity: @wedding_topping.popularity }
    end

    assert_redirected_to wedding_topping_path(assigns(:wedding_topping))
  end

  test "should show wedding_topping" do
    get :show, id: @wedding_topping
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wedding_topping
    assert_response :success
  end

  test "should update wedding_topping" do
    patch :update, id: @wedding_topping, wedding_topping: { code: @wedding_topping.code, name: @wedding_topping.name, popularity: @wedding_topping.popularity }
    assert_redirected_to wedding_topping_path(assigns(:wedding_topping))
  end

  test "should destroy wedding_topping" do
    assert_difference('WeddingTopping.count', -1) do
      delete :destroy, id: @wedding_topping
    end

    assert_redirected_to wedding_toppings_path
  end
end
