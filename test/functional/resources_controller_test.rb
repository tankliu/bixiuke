# -*- encoding : utf-8 -*-

require 'test_helper'

class ResourcesControllerTest < ActionController::TestCase
  setup do
    @resource = resources(:one)
  end

  test "should not create and update and destroy if person is not log in" do
    get :edit, {:id => @resource}
    assert_redirected_to login_url
    post :create, {:resource => @resource.attributes}
    assert_redirected_to login_url
    put :update, {:id => @resource, :resource => @resource.attributes}
    assert_redirected_to login_url
    delete :destroy, {:id => @resource}
    assert_redirected_to login_url
    
  end
  
  test "should not create and update and destroy if person is not member " do
    get :edit, {:id => @resource}, {:person_id => people(:youke).id}
    assert_redirected_to guangpan_path
    post :create, {:resource => @resource.attributes}, {:person_id => people(:youke).id}
    assert_redirected_to guangpan_path
    put :update, {:id => @resource, :resource => @resource.attributes}, {:person_id => people(:youke).id}
    assert_redirected_to guangpan_path    
    delete :destroy, {:id => @resource}, {:person_id => people(:youke).id}
    assert_redirected_to guangpan_path
    
  end
  
  test "should not update and destroy if resource is not belong to person" do
    assert_raise(ActiveRecord::RecordNotFound) {get :edit, {:id => @resource}, {:person_id => people(:xueyuan).id}}
    assert_raise(ActiveRecord::RecordNotFound) {put :update, {:id => @resource, :resource => @resource.attributes}, {:person_id => people(:xueyuan).id}}
    assert_raise(ActiveRecord::RecordNotFound) {delete :destroy, {:id => @resource}, {:person_id => people(:xueyuan).id}}
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:resources)
  end
  
  test "should get index when past category id"  do
    get :index, {:category_id => categories(:A3).id}
    assert_response :success
    assert_not_nil assigns(:resources)
    assert_equal 2, assigns(:resources).size 
  end
  

  test "should create resource" do
    assert_difference('Resource.count', 1) do
      post :create, {resource: resources(:two).attributes}, {:person_id => people(:xueyuan)}
    end
    assert_redirected_to resources_path
  end

  test "should get edit" do
    get :edit, {id: resources(:two)}, {:person_id => people(:xueyuan)}
    assert_response :success
  end

  test "should update resource" do
    put :update, {id: resources(:two), resource: @resource.attributes}, {:person_id => people(:xueyuan)}
    assert_redirected_to resources_path
  end

  test "should destroy resource" do
    assert_difference('Resource.count', -1) do
      delete :destroy, {id: resources(:two)}, {:person_id => people(:xueyuan)}
    end
    assert_redirected_to resources_path
  end
end
