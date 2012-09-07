# -*- encoding : utf-8 -*-
require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should not login" do
    post :create, {:name => users(:xueyuan).name, :password => "111111"}
    assert_template 'new'
  end
  
  test "should login" do
    post :create, {:name => users(:xueyuan).name, :password => "123456"}
    assert_redirected_to user_path(assigns(:user))
  end
  
  test "should log out" do
    get :destroy, nil, {:user_id => @user}
    assert_redirected_to login_url
  end

end
