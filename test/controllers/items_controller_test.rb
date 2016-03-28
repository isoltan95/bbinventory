require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    @item = items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
<<<<<<< HEAD
      post :create, item: { category: @item.category, code: @item.code, name: @item.name, price: @item.price }
=======
      post :create, item: { age: @item.age, barcode: @item.barcode, category_id: @item.category_id, gender: @item.gender, name: @item.name, notes: @item.notes, quantity: @item.quantity, type: @item.type }
>>>>>>> de33097513c436ed2c6cffe448fc3ff9cb7df618
    end

    assert_redirected_to item_path(assigns(:item))
  end

  test "should show item" do
    get :show, id: @item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item
    assert_response :success
  end

  test "should update item" do
<<<<<<< HEAD
    patch :update, id: @item, item: { category: @item.category, code: @item.code, name: @item.name, price: @item.price }
=======
    patch :update, id: @item, item: { age: @item.age, barcode: @item.barcode, category_id: @item.category_id, gender: @item.gender, name: @item.name, notes: @item.notes, quantity: @item.quantity, type: @item.type }
>>>>>>> de33097513c436ed2c6cffe448fc3ff9cb7df618
    assert_redirected_to item_path(assigns(:item))
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete :destroy, id: @item
    end

    assert_redirected_to items_path
  end
<<<<<<< HEAD

=======
>>>>>>> de33097513c436ed2c6cffe448fc3ff9cb7df618
end
