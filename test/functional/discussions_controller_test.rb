# -*- encoding : utf-8 -*-
require 'test_helper'

class DiscussionsControllerTest < ActionController::TestCase
  setup do
    @discussion = discussions(:one)
  end

  test "should not create and update and destroy if user is not log in" do
    get :edit, {:id => @discussion}
    assert_redirected_to login_url
    post :create, {:discussion => @discussion.attributes}
    assert_redirected_to login_url
    put :update, {:id => @discussion, :discussion => @discussion.attributes}
    assert_redirected_to login_url
    delete :destroy, {:id => @discussion}
    assert_redirected_to login_url
    
  end
  
  test "should not create and update and destroy if user is not member " do
    get :edit, {:id => @discussion}, {:user_id => users(:youke).id}
    assert_redirected_to join_path
    post :create, {:discussion => @discussion.attributes}, {:user_id => users(:youke).id}
    assert_redirected_to join_path
    put :update, {:id => @discussion, :discussion => @discussion.attributes}, {:user_id => users(:youke).id}
    assert_redirected_to join_path    
    delete :destroy, {:id => @discussion}, {:user_id => users(:youke).id}
    assert_redirected_to join_path
    
  end
  
  test "should not update and destroy if discussion is not belong to user" do
    assert_raise(ActiveRecord::RecordNotFound) {get :edit, {:id => @discussion}, {:user_id => users(:xueyuan).id}}
    assert_raise(ActiveRecord::RecordNotFound) {put :update, {:id => @discussion, :discussion => @discussion.attributes}, {:user_id => users(:xueyuan).id}}
    assert_raise(ActiveRecord::RecordNotFound) {delete :destroy, {:id => @discussion}, {:user_id => users(:xueyuan).id}}
  end

  test "should create discussion" do
    assert_difference('Discussion.count', 1) do
      post :create, {discussion: @discussion.attributes}, {:user_id => users(:xueyuan)}
    end
    assert_redirected_to @discussion.classroom
  end

  test "should get edit" do
    get :edit, {id: discussions(:two)}, {:user_id => users(:xueyuan)}
    assert_response :success
  end

  test "should update discussion" do
    put :update, {id: discussions(:two), discussion: @discussion.attributes}, {:user_id => users(:xueyuan)}
    assert_redirected_to discussions(:two)
  end

  test "should destroy discussion" do
    assert_difference('Discussion.count', -1) do
      delete :destroy, {id: discussions(:two)}, {:user_id => users(:xueyuan)}
    end
    assert_redirected_to discussions(:two).classroom
  end

end
