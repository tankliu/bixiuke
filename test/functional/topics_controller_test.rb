# -*- encoding : utf-8 -*-
require 'test_helper'

class TopicsControllerTest < ActionController::TestCase
  setup do
    @topic = topics(:one)
  end

  test "should not create and update and destroy if person is not log in" do
    get :edit, {:id => @topic}
    assert_redirected_to login_url
    post :create, {:topic => @topic.attributes}
    assert_redirected_to login_url
    put :update, {:id => @topic, :topic => @topic.attributes}
    assert_redirected_to login_url
    delete :destroy, {:id => @topic}
    assert_redirected_to login_url
    
  end
  
  test "should not create and update and destroy if person is not member " do
    get :edit, {:id => @topic}, {:person_id => people(:youke).id}
    assert_redirected_to xueyuan_path
    post :create, {:topic => @topic.attributes}, {:person_id => people(:youke).id}
    assert_redirected_to xueyuan_path
    put :update, {:id => @topic, :topic => @topic.attributes}, {:person_id => people(:youke).id}
    assert_redirected_to xueyuan_path    
    delete :destroy, {:id => @topic}, {:person_id => people(:youke).id}
    assert_redirected_to xueyuan_path
    
  end
  
  test "should not update and destroy if topic is not belong to person" do
    assert_raise(ActiveRecord::RecordNotFound) {get :edit, {:id => @topic}, {:person_id => people(:xueyuan).id}}
    assert_raise(ActiveRecord::RecordNotFound) {put :update, {:id => @topic, :topic => @topic.attributes}, {:person_id => people(:xueyuan).id}}
    assert_raise(ActiveRecord::RecordNotFound) {delete :destroy, {:id => @topic}, {:person_id => people(:xueyuan).id}}
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:topics)
  end


  test "should create topic" do
    assert_difference('Topic.count', 1) do
      post :create, {topic: @topic.attributes}, {:person_id => people(:xueyuan)}
    end
    assert_redirected_to topics_path
  end

  test "should get edit" do
    get :edit, {id: topics(:two)}, {:person_id => people(:xueyuan)}
    assert_response :success
  end

  test "should update topic" do
    put :update, {id: topics(:two), topic: @topic.attributes}, {:person_id => people(:xueyuan)}
    assert_redirected_to topics_path
  end

  test "should destroy topic" do
    assert_difference('Topic.count', -1) do
      delete :destroy, {id: topics(:two)}, {:person_id => people(:xueyuan)}
    end
    assert_redirected_to topics_path
  end
end
