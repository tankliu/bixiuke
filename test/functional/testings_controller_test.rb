# -*- encoding : utf-8 -*-
require 'test_helper'

class TestingsControllerTest < ActionController::TestCase
  setup do
    @testing = testings(:one)
  end

  test "should not create and update and destroy if person is not log in" do
    get :edit, {:id => @testing}
    assert_redirected_to login_url
    post :create, {:app => @testing.attributes}
    assert_redirected_to login_url
    put :update, {:id => @testing, :testing => @testing.attributes}
    assert_redirected_to login_url
    delete :destroy, {:id => @testing}
    assert_redirected_to login_url
    
  end
  
  test "should not create and update and destroy if person is not member " do
    get :edit, {:id => @testing}, {:person_id => people(:youke).id}
    assert_redirected_to guangpan_path
    post :create, {:testing => @testing.attributes}, {:person_id => people(:youke).id}
    assert_redirected_to guangpan_path
    put :update, {:id => @testing, :testing => @testing.attributes}, {:person_id => people(:youke).id}
    assert_redirected_to guangpan_path    
    delete :destroy, {:id => @testing}, {:person_id => people(:youke).id}
    assert_redirected_to guangpan_path
    
  end
  
  test "should not update and destroy if testing is not belong to person" do
    assert_raise(ActiveRecord::RecordNotFound) {get :edit, {:id => @testing}, {:person_id => people(:xueyuan).id}}
    assert_raise(ActiveRecord::RecordNotFound) {put :update, {:id => @testing, :testing => @testing.attributes}, {:person_id => people(:xueyuan).id}}
    assert_raise(ActiveRecord::RecordNotFound) {delete :destroy, {:id => @testing}, {:person_id => people(:xueyuan).id}}
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:testings)
  end
  

  test "should create testing" do
    assert_difference('Testing.count', 1) do
      post :create, {testing: testings(:two).attributes}, {:person_id => people(:xueyuan)}
    end
    assert_redirected_to testings_path
  end

  test "should get edit" do
    get :edit, {id: testings(:two)}, {:person_id => people(:xueyuan)}
    assert_response :success
  end

  test "should update testing" do
    put :update, {id: testings(:two), testing: @testing.attributes}, {:person_id => people(:xueyuan)}
    assert_redirected_to testings(:two)
  end

  test "should destroy testing" do
    assert_difference('Testing.count', -1) do
      delete :destroy, {id: testings(:two)}, {:person_id => people(:xueyuan)}
    end
    assert_redirected_to testings_path
  end
end
