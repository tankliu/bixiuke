# -*- encoding : utf-8 -*-
require 'test_helper'

class SubjectsControllerTest < ActionController::TestCase
  setup do
    @subject = subjects(:one)
  end

  test "should not create and update and destroy if person is not log in" do
    get :edit, {:id => @subject}
    assert_redirected_to login_url
    post :create, {:subject => @subject.attributes}
    assert_redirected_to login_url
    put :update, {:id => @subject, :subject => @subject.attributes}
    assert_redirected_to login_url
    delete :destroy, {:id => @subject}
    assert_redirected_to login_url
    
  end
  
  test "should not create and update and destroy if person is not member " do
    get :edit, {:id => @subject}, {:person_id => people(:youke).id}
    assert_redirected_to guangpan_path
    post :create, {:subject => @subject.attributes}, {:person_id => people(:youke).id}
    assert_redirected_to guangpan_path
    put :update, {:id => @subject, :subject => @subject.attributes}, {:person_id => people(:youke).id}
    assert_redirected_to guangpan_path    
    delete :destroy, {:id => @subject}, {:person_id => people(:youke).id}
    assert_redirected_to guangpan_path
    
  end
  
  test "should not update and destroy if one subject is not belong to person" do
    assert_raise(ActiveRecord::RecordNotFound) {get :edit, {:id => @subject}, {:person_id => people(:xueyuan).id}}
    assert_raise(ActiveRecord::RecordNotFound) {put :update, {:id => @subject, :subject => @subject.attributes}, {:person_id => people(:xueyuan).id}}
    assert_raise(ActiveRecord::RecordNotFound) {delete :destroy, {:id => @subject}, {:person_id => people(:xueyuan).id}}
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subjects)
  end
  
  
  test "should create subject" do
    assert_difference('Subject.count', 1) do
      post :create, {subject: @subject.attributes}, {:person_id => people(:xueyuan)}
    end
    assert_redirected_to assigns(:subject).person
  end

  test "should get edit" do
    get :edit, {id: subjects(:two)}, {:person_id => people(:xueyuan)}
    assert_response :success
  end

  test "should update subject" do
    put :update, {id: subjects(:two), subject: @subject.attributes}, {:person_id => people(:xueyuan)}
    assert_redirected_to subjects_path
  end

  test "should destroy subject" do
    assert_difference('Subject.count', -1) do
      delete :destroy, {id: subjects(:two)}, {:person_id => people(:xueyuan)}
    end
    assert_redirected_to subjects_path
  end

end
