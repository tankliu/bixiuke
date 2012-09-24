# -*- encoding : utf-8 -*-
require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = comments(:one)
  end

  test "should not create and update and destroy if person is not log in" do
    post :create, {:comment => @comment.attributes}
    assert_redirected_to login_url
    delete :destroy, {:id => @comment}
    assert_redirected_to login_url
    
  end
  
  test "should not create and update and destroy if person is not member " do
    post :create, {:comment => @comment.attributes}, {:person_id => people(:youke).id}
    assert_redirected_to xueyuan_path
    delete :destroy, {:id => @comment}, {:person_id => people(:youke).id}
    assert_redirected_to xueyuan_path
    
  end
  
  test "should not update and destroy if comment is not belong to person" do
    assert_raise(ActiveRecord::RecordNotFound) {delete :destroy, {:id => @comment}, {:person_id => people(:xueyuan).id}}
  end

  test "should create comment" do
    assert_difference('Comment.count', 1) do
      post :create, {comment: @comment.attributes}, {:person_id => people(:xueyuan)}
    end
    assert_redirected_to @comment.commable
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete :destroy, {id: comments(:two)}, {:person_id => people(:xueyuan)}
    end
    assert_redirected_to comments(:two).commable
  end
end
