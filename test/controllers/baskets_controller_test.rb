require 'test_helper'

class BasketsControllerTest < ActionController::TestCase
<<<<<<< HEAD
  # test "the truth" do
  #   assert true
  # end
=======
  setup do
    @basket = baskets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:baskets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create basket" do
    assert_difference('Basket.count') do
      post :create, basket: { checkout_date: @basket.checkout_date }
    end

    assert_redirected_to basket_path(assigns(:basket))
  end

  test "should show basket" do
    get :show, id: @basket
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @basket
    assert_response :success
  end

  test "should update basket" do
    patch :update, id: @basket, basket: { checkout_date: @basket.checkout_date }
    assert_redirected_to basket_path(assigns(:basket))
  end

  test "should destroy basket" do
    assert_difference('Basket.count', -1) do
      delete :destroy, id: @basket
    end

    assert_redirected_to baskets_path
  end
>>>>>>> de33097513c436ed2c6cffe448fc3ff9cb7df618
end
