# -*- encoding : utf-8 -*-
require 'test_helper'

class ClassroomsControllerTest < ActionController::TestCase
    setup do
      @classroom = classrooms(:one)
    end

    test "should not get and post if user is not log in" do
      get :new
      assert_redirected_to login_url

      get :edit, {:id => @classroom}
      assert_redirected_to login_url

      post :create, {:classroom => @classroom.attributes}
      assert_redirected_to login_url

      put :update, {:id => @classroom, :classroom => @classroom.attributes}
      assert_redirected_to login_url

      delete :destroy, {:id => @classroom}
      assert_redirected_to login_url
    end


    test "should not get or post if user is not admin " do

      get :new, nil, {:user_id => users(:xueyuan).id}
      assert_redirected_to :root

      get :edit, {:id => @classroom}, {:user_id => users(:xueyuan).id}
      assert_redirected_to :root

      post :create, {:classroom => @classroom.attributes}, {:user_id => users(:xueyuan).id}
      assert_redirected_to :root

      put :update, {:id => @classroom, :classroom => @classroom.attributes}, {:user_id => users(:xueyuan).id}
      assert_redirected_to :root    

      delete :destroy, {:id => @classroom}, {:user_id => users(:xueyuan).id}
      assert_redirected_to :root

    end


  # if user is admin

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:classrooms)
    end
    
    test "should get show" do
      get :show, :id => @classroom
      assert_response :success
      assert_not_nil assigns(:classroom)
      
    end
    
    test "get new" do
      get :new, nil, {:user_id => users(:admin)}
      assert_response :success
    end


    test "should create classroom if user is admin" do
      assert_difference('Classroom.count', 1) do
        post :create, {:classroom => @classroom.attributes}, {:user_id => users(:admin)}
      end
      assert_redirected_to assigns(:classroom)
    end


    test "should get edit" do  
      get :edit, {:id => @classroom}, {:user_id => users(:admin)}
      assert_response :success
    end


    test "should update classroom if user is admin" do
      put :update, {:id => @classroom, :classroom => classrooms(:two).attributes },{:user_id => users(:admin)}
      assert_redirected_to @classroom
    end


    test "should destroy classroom" do
      assert_difference('Classroom.count', -1) do
        delete :destroy, {:id => @classroom}, {:user_id => users(:admin)}
      end
      assert_redirected_to classrooms_path
    end

end
