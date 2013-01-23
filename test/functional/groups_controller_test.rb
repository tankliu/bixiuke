# -*- encoding : utf-8 -*-
require 'test_helper'

class GroupsControllerTest < ActionController::TestCase
  setup do
    @group = groups(:one)
  end

  test "should not create and update and destroy if person is not log in" do
    get :edit, {:id => @group}
    assert_redirected_to login_url
    post :create, {:group => @group.attributes}
    assert_redirected_to login_url
    put :update, {:id => @group, :group => @group.attributes}
    assert_redirected_to login_url
    delete :destroy, {:id => @group}
    assert_redirected_to login_url
    
  end
  
  test "should not create and update and destroy if person is not admin " do
    get :edit, {:id => @group}, {:person_id => people(:xueyuan).id}
    assert_redirected_to :root
    post :create, {:group => @group.attributes}, {:person_id => people(:xueyuan).id}
    assert_redirected_to :root
    put :update, {:id => @group, :group => @group.attributes}, {:person_id => people(:xueyuan).id}
    assert_redirected_to :root    
    delete :destroy, {:id => @group}, {:person_id => people(:xueyuan).id}
    assert_redirected_to :root
    
  end
  
  test "should not update and destroy if group is not belong to person" do
    # assert_raise(ActiveRecord::RecordNotFound) {get :edit, {:id => @group}, {:person_id => people(:xueyuan).id}}
    #  assert_raise(ActiveRecord::RecordNotFound) {put :update, {:id => @group, :group => @group.attributes}, {:person_id => people(:xueyuan).id}}
    #  assert_raise(ActiveRecord::RecordNotFound) {delete :destroy, {:id => @group}, {:person_id => people(:xueyuan).id}}
  end
  
  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:groups)
  # end
  


  test "should create group" do
    assert_difference('Group.count', 1) do
      post :create, {group: @group.attributes}, {:person_id => people(:admin)}
    end
    assert_redirected_to assigns(:group)
  end

  test "should get edit" do
    get :edit, {id: groups(:two)}, {:person_id => people(:admin)}
    assert_response :success
  end

  test "should update group" do
    put :update, {id: groups(:two), group: @group.attributes}, {:person_id => people(:admin)}
    assert_redirected_to assigns(:group)
  end

  test "should destroy group" do
    assert_difference('Group.count', -1) do
      delete :destroy, {id: groups(:two)}, {:person_id => people(:admin)}
    end
    assert_redirected_to groups_path
  end
  
end