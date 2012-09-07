# -*- encoding : utf-8 -*-
require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:youke)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end
  

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should not create user with mass-assignment" do
    assert_no_difference('User.count') do
      assert_raise(ActiveModel::MassAssignmentSecurity::Error) {post :create, user: @user.attributes}
    end
  end
  
  test "should create user with no mass-assignment" do
    assert_difference('User.count', 1) do
      post :create, :user => {:name => "xiaohualang", :password => "123456", :password_confirmation  => "123456", :nick_name => "大狼", :city => "广州"}
    end    
    assert_not_nil assigns(:user)
    # raise assigns(:user).errors.full_messages.to_s
    #    assert_redirected_to user_path(assigns(:user))
  end
  

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end
  
  test "should not get edit if it is not log in" do
    get :edit, {id: @user}, nil
    assert_response :redirect
    assert_redirected_to login_url
    
  end
  
  test "should get edit" do
    get :edit, {id: @user}, {:user_id => @user.id}
    assert_response :success
  end
  
  test "should not update if it is not log in" do
    put :update, {:id => @user.id, :password => "123456", :password_confirmation  => "123456", :nick_name => "大狼", :city => "广州"}, nil
    assert_redirected_to login_url
  end
  
  test "should get the current_user if want to edit another user" do
    get :edit, {id: @user}, {:user_id => users(:xueyuan).id}
    assert_equal assigns(:user).id, users(:xueyuan).id
    assert_response :success
    #redirect_to show
  end

  
  test "should not update user with mass-assignment" do
    assert_raise(ActiveModel::MassAssignmentSecurity::Error) {put :update, {id: @user, user: @user.attributes}, {:user_id => @user.id}}
  end
  
  test "should update current_use if want to edit another user" do
    put :update, {:id => @user.id, :password => "123456", :password_confirmation  => "123456", :nick_name => "大狼", :city => "广州"}, {:user_id => users(:xueyuan).id}
    assert_equal assigns(:user).id, users(:xueyuan).id
    assert_response :redirect
  end
  
  
  test "should update user with no mass-assignment and if it is the same user" do
    put :update, {:id => @user.id, :password => "123456", :password_confirmation  => "123456", :nick_name => "大狼", :city => "广州"}, {:user_id => @user.id}
    assert_not_nil assigns(:user)
    assert_redirected_to user_path(assigns(:user))
  end
  
  
  test "should not destroy user if user is not admin" do
    assert_no_difference "User.count" do
      delete :destroy, {:id => @user}, {:user_id => users(:xueyuan).id}
    end
    assert_response :redirect
  end
  
  test "should destroy user if it is admin" do
    assert_difference('User.count', -1) do
      delete :destroy, {id: @user}, {:user_id => users(:admin).id}
    end
    assert_redirected_to users_path
  end
  

  test "should not change_role if user is not admin" do
    put :update, {id: @user, :role => "学员"}, {:user_id => @user.id}
    assert_equal "", assigns(:user).role
  end
  
  test "should change_role" do
    put :update,{:id => @user, :role => "学员"}, {:user_id => users(:admin)}
    assert_equal "学员", assigns(:user).role
  end

  test "should not get new if log in" do
    get :new, nil, {user_id: users(:xueyuan)}
    assert_redirected_to :root
  end
  
  test "should get new if user is admin" do
    get :new, nil, {user_id: users(:admin)}
    assert_response :success
  end
   
end
