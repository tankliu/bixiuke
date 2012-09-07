# -*- encoding : utf-8 -*-
require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  setup do
    @course = courses(:one)
  end
  
  test "should not get new and edit if user is not log in" do
    get :new
    assert_redirected_to login_url
    get :edit, {:id => @course}
    assert_redirected_to login_url
    post :create, {:course => @course.attributes}
    assert_redirected_to login_url
    put :update, {:id => @course, :course => @course.attributes}
    assert_redirected_to login_url
    delete :destroy, {:id => @course}
    assert_redirected_to login_url
  end
  
  
  test "should not create and update and destroy if user is not admin " do
    get :new, nil, {:user_id => users(:xueyuan).id}
    assert_redirected_to :root
    get :edit, {:id => @course}, {:user_id => users(:xueyuan).id}
    assert_redirected_to :root
    post :create, {:course => @course.attributes}, {:user_id => users(:xueyuan).id}
    assert_redirected_to :root
    put :update, {:id => @course, :course => @course.attributes}, {:user_id => users(:xueyuan).id}
    assert_redirected_to :root    
    delete :destroy, {:id => @course}, {:user_id => users(:xueyuan).id}
    assert_redirected_to :root
    
  end
  
  
  
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:courses)
  end

  test "get new" do
    get :new, nil, {:user_id => users(:admin).id}
    assert_response :success
    
    get :new, nil, {:user_id => users(:xueyuan).id}
    assert_response :redirect
    
  end

  test "should not create course if user is not admin" do
    assert_no_difference('Course.count') do
      post :create, {:course => @course.attributes}, {:user_id => users(:xueyuan).id}
    end
    assert_redirected_to :root
  end
  
  test "should create course if user is admin" do
    assert_difference('Course.count', 1) do
      post :create, {:course => @course.attributes}, {:user_id => users(:admin).id}
    end
    assert_redirected_to courses_path
  end

  test "should not get edit is user is not admin" do
    get :edit, {:id => @course}, {:user_id => users(:xueyuan).id}
    assert_redirected_to :root
  end
  

  test "should get edit" do  
    get :edit, {:id => @course}, {:user_id => users(:admin).id}
    assert_response :success
  end
  

  test "should not update course is user is not admin" do
    put :update, {:id => @course, :course => @course.attributes},{:user_id => users(:xueyuan).id}
    assert_redirected_to :root
  end
  
  test "should update course if user is admin" do
    put :update, {:id => @course, :course => @course.attributes},{:user_id => users(:admin).id}
    assert_redirected_to courses_path
  end

  test "should not destroy course if user is not admin" do
    assert_no_difference('Course.count') do
      delete :destroy, {:id => @course}, {:user_id => users(:xueyuan).id}
    end
    assert_redirected_to :root
  end
  
  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete :destroy, {:id => @course}, {:user_id => users(:admin).id}
    end
    assert_redirected_to courses_path
  end
end
