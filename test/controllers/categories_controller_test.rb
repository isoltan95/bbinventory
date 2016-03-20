require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
<<<<<<< HEAD
  test "should get create" do
    get :create
    assert_response :success
=======
  setup do
    @category = categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
>>>>>>> de33097513c436ed2c6cffe448fc3ff9cb7df618
  end

  test "should get new" do
    get :new
    assert_response :success
  end

<<<<<<< HEAD
  test "should get update" do
    get :update
=======
  test "should create category" do
    assert_difference('Category.count') do
      post :create, category: { name: @category.name }
    end

    assert_redirected_to category_path(assigns(:category))
  end

  test "should show category" do
    get :show, id: @category
>>>>>>> de33097513c436ed2c6cffe448fc3ff9cb7df618
    assert_response :success
  end

  test "should get edit" do
<<<<<<< HEAD
    get :edit
    assert_response :success
  end

=======
    get :edit, id: @category
    assert_response :success
  end

  test "should update category" do
    patch :update, id: @category, category: { name: @category.name }
    assert_redirected_to category_path(assigns(:category))
  end

  test "should destroy category" do
    assert_difference('Category.count', -1) do
      delete :destroy, id: @category
    end

    assert_redirected_to categories_path
  end
>>>>>>> de33097513c436ed2c6cffe448fc3ff9cb7df618
end
