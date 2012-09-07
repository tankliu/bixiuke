# -*- encoding : utf-8 -*-
require 'test_helper'

class TopicsControllerTest < ActionController::TestCase
  setup do
    @topic = topics(:one)
  end

  test "should not create and update and destroy if user is not log in" do
    get :edit, {:id => @topic}
    assert_redirected_to login_url
    post :create, {:topic => @topic.attributes}
    assert_redirected_to login_url
    put :update, {:id => @topic, :topic => @topic.attributes}
    assert_redirected_to login_url
    delete :destroy, {:id => @topic}
    assert_redirected_to login_url
    
  end
  
  test "should not create and update and destroy if user is not member " do
    get :edit, {:id => @topic}, {:user_id => users(:youke).id}
    assert_redirected_to join_path
    post :create, {:topic => @topic.attributes}, {:user_id => users(:youke).id}
    assert_redirected_to join_path
    put :update, {:id => @topic, :topic => @topic.attributes}, {:user_id => users(:youke).id}
    assert_redirected_to join_path    
    delete :destroy, {:id => @topic}, {:user_id => users(:youke).id}
    assert_redirected_to join_path
    
  end
  
  test "should not update and destroy if topic is not belong to user" do
    assert_raise(ActiveRecord::RecordNotFound) {get :edit, {:id => @topic}, {:user_id => users(:xueyuan).id}}
    assert_raise(ActiveRecord::RecordNotFound) {put :update, {:id => @topic, :topic => @topic.attributes}, {:user_id => users(:xueyuan).id}}
    assert_raise(ActiveRecord::RecordNotFound) {delete :destroy, {:id => @topic}, {:user_id => users(:xueyuan).id}}
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:topics)
  end


  test "should create topic" do
    assert_difference('Topic.count', 1) do
      post :create, {topic: @topic.attributes}, {:user_id => users(:xueyuan)}
    end
    assert_redirected_to topics_path
  end

  test "should get edit" do
    get :edit, {id: topics(:two)}, {:user_id => users(:xueyuan)}
    assert_response :success
  end

  test "should update topic" do
    put :update, {id: topics(:two), topic: @topic.attributes}, {:user_id => users(:xueyuan)}
    assert_redirected_to topics_path
  end

  test "should destroy topic" do
    assert_difference('Topic.count', -1) do
      delete :destroy, {id: topics(:two)}, {:user_id => users(:xueyuan)}
    end
    assert_redirected_to topics_path
  end
end
