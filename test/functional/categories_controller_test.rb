# -*- encoding : utf-8 -*-

require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  setup do
    @category = categories(:A1)
  end

  test "should not get and post if user is not log in" do
    get :index
    assert_redirected_to login_url

    get :new
    assert_redirected_to login_url

    get :edit, {:id => @category}
    assert_redirected_to login_url

    post :create, {:category => @category.attributes}
    assert_redirected_to login_url

    put :update, {:id => @category, :category => @category.attributes}
    assert_redirected_to login_url

    delete :destroy, {:id => @category}
    assert_redirected_to login_url
  end


  test "should not get or post if user is not admin " do
    get :index, nil, {:user_id => users(:xueyuan).id}
    assert_redirected_to :root
    
    get :new, nil, {:user_id => users(:xueyuan).id}
    assert_redirected_to :root

    get :edit, {:id => @category}, {:user_id => users(:xueyuan).id}
    assert_redirected_to :root

    post :create, {:category => @category.attributes}, {:user_id => users(:xueyuan).id}
    assert_redirected_to :root

    put :update, {:id => @category, :category => @category.attributes}, {:user_id => users(:xueyuan).id}
    assert_redirected_to :root    

    delete :destroy, {:id => @category}, {:user_id => users(:xueyuan).id}
    assert_redirected_to :root

  end


# if user is admin

  test "should get index" do
    get :index, nil, {:user_id => users(:admin)}
    assert_response :success
    assert_not_nil assigns(:article_categories)
    assert_not_nil assigns(:note_categories)
    assert_not_nil assigns(:resource_categories)

  end
  test "get new" do
    get :new, nil, {:user_id => users(:admin)}
    assert_response :success
  end


  test "should create category if user is admin" do
    assert_difference('Category.count', 1) do
      post :create, {:category => {name: @category.name, order_number: @category.order_number }}, {:user_id => users(:admin)}
    end
    assert_redirected_to categories_path
  end


  test "should get edit" do  
    get :edit, {:id => @category}, {:user_id => users(:admin)}
    assert_response :success
  end


  test "should update category if user is admin" do
    put :update, {:id => @category, category: {name: @category.name, order_number: @category.order_number}},{:user_id => users(:admin)}
    assert_redirected_to categories_path
  end


  test "should destroy category" do
    assert_difference('Category.count', -1) do
      delete :destroy, {:id => @category}, {:user_id => users(:admin)}
    end
    assert_redirected_to categories_path
  end
  
end
