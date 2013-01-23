# -*- encoding : utf-8 -*-
require 'test_helper'

class DiscussionsControllerTest < ActionController::TestCase
  setup do
    @discussion = discussions(:one)
  end

  test "should not create and update and destroy if person is not log in" do
    get :edit, {:id => @discussion}
    assert_redirected_to login_url
    post :create, {:discussion => @discussion.attributes}
    assert_redirected_to login_url
    put :update, {:id => @discussion, :discussion => @discussion.attributes}
    assert_redirected_to login_url
    delete :destroy, {:id => @discussion}
    assert_redirected_to login_url
    
  end
  
  test "should not create and update and destroy if person is not member " do
    get :edit, {:id => @discussion}, {:person_id => people(:youke).id}
    assert_redirected_to guangpan_path
    post :create, {:discussion => @discussion.attributes}, {:person_id => people(:youke).id}
    assert_redirected_to guangpan_path
    put :update, {:id => @discussion, :discussion => @discussion.attributes}, {:person_id => people(:youke).id}
    assert_redirected_to guangpan_path    
    delete :destroy, {:id => @discussion}, {:person_id => people(:youke).id}
    assert_redirected_to guangpan_path
    
  end
  
  test "should not update and destroy if discussion is not belong to person" do
    assert_raise(ActiveRecord::RecordNotFound) {get :edit, {:id => @discussion}, {:person_id => people(:xueyuan).id}}
    assert_raise(ActiveRecord::RecordNotFound) {put :update, {:id => @discussion, :discussion => @discussion.attributes}, {:person_id => people(:xueyuan).id}}
    assert_raise(ActiveRecord::RecordNotFound) {delete :destroy, {:id => @discussion}, {:person_id => people(:xueyuan).id}}
  end

  test "should create discussion" do
    assert_difference('Discussion.count', 1) do
      post :create, {discussion: @discussion.attributes}, {:person_id => people(:xueyuan)}
    end
    assert_redirected_to @discussion.classroom
  end

  test "should get edit" do
    get :edit, {id: discussions(:two)}, {:person_id => people(:xueyuan)}
    assert_response :success
  end

  test "should update discussion" do
    put :update, {id: discussions(:two), discussion: @discussion.attributes}, {:person_id => people(:xueyuan)}
    assert_redirected_to discussions(:two)
  end

  test "should destroy discussion" do
    assert_difference('Discussion.count', -1) do
      delete :destroy, {id: discussions(:two)}, {:person_id => people(:xueyuan)}
    end
    assert_redirected_to discussions(:two).classroom
  end

end
