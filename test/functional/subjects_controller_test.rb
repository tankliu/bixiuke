# -*- encoding : utf-8 -*-
require 'test_helper'

class SubjectsControllerTest < ActionController::TestCase
  setup do
    @subject = subjects(:one)
  end

  test "should not create and update and destroy if user is not log in" do
    get :edit, {:id => @subject}
    assert_redirected_to login_url
    post :create, {:subject => @subject.attributes}
    assert_redirected_to login_url
    put :update, {:id => @subject, :subject => @subject.attributes}
    assert_redirected_to login_url
    delete :destroy, {:id => @subject}
    assert_redirected_to login_url
    
  end
  
  test "should not create and update and destroy if user is not member " do
    get :edit, {:id => @subject}, {:user_id => users(:youke).id}
    assert_redirected_to join_path
    post :create, {:subject => @subject.attributes}, {:user_id => users(:youke).id}
    assert_redirected_to join_path
    put :update, {:id => @subject, :subject => @subject.attributes}, {:user_id => users(:youke).id}
    assert_redirected_to join_path    
    delete :destroy, {:id => @subject}, {:user_id => users(:youke).id}
    assert_redirected_to join_path
    
  end
  
  test "should not update and destroy if one subject is not belong to user" do
    assert_raise(ActiveRecord::RecordNotFound) {get :edit, {:id => @subject}, {:user_id => users(:xueyuan).id}}
    assert_raise(ActiveRecord::RecordNotFound) {put :update, {:id => @subject, :subject => @subject.attributes}, {:user_id => users(:xueyuan).id}}
    assert_raise(ActiveRecord::RecordNotFound) {delete :destroy, {:id => @subject}, {:user_id => users(:xueyuan).id}}
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subjects)
  end
  
  
  test "should create subject" do
    assert_difference('Subject.count', 1) do
      post :create, {subject: @subject.attributes}, {:user_id => users(:xueyuan)}
    end
    assert_redirected_to assigns(:subject).user
  end

  test "should get edit" do
    get :edit, {id: subjects(:two)}, {:user_id => users(:xueyuan)}
    assert_response :success
  end

  test "should update subject" do
    put :update, {id: subjects(:two), subject: @subject.attributes}, {:user_id => users(:xueyuan)}
    assert_redirected_to subjects_path
  end

  test "should destroy subject" do
    assert_difference('Subject.count', -1) do
      delete :destroy, {id: subjects(:two)}, {:user_id => users(:xueyuan)}
    end
    assert_redirected_to subjects_path
  end

end
