# -*- encoding : utf-8 -*-
require 'test_helper'

class NotesControllerTest < ActionController::TestCase
  setup do
    @note = notes(:one)
  end

  test "should not create and update and destroy if user is not log in" do
    get :edit, {:id => @note}
    assert_redirected_to login_url
    post :create, {:note => @note.attributes}
    assert_redirected_to login_url
    put :update, {:id => @note, :note => @note.attributes}
    assert_redirected_to login_url
    delete :destroy, {:id => @note}
    assert_redirected_to login_url
    
  end
  
  test "should not create and update and destroy if user is not member " do
    get :edit, {:id => @note}, {:user_id => users(:youke).id}
    assert_redirected_to join_path
    post :create, {:note => @note.attributes}, {:user_id => users(:youke).id}
    assert_redirected_to join_path
    put :update, {:id => @note, :note => @note.attributes}, {:user_id => users(:youke).id}
    assert_redirected_to join_path    
    delete :destroy, {:id => @note}, {:user_id => users(:youke).id}
    assert_redirected_to join_path
    
  end
  
  test "should not update and destroy if note is not belong to user" do
    assert_raise(ActiveRecord::RecordNotFound) {get :edit, {:id => @note}, {:user_id => users(:xueyuan).id}}
    assert_raise(ActiveRecord::RecordNotFound) {put :update, {:id => @note, :note => @note.attributes}, {:user_id => users(:xueyuan).id}}
    assert_raise(ActiveRecord::RecordNotFound) {delete :destroy, {:id => @note}, {:user_id => users(:xueyuan).id}}
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notes)
  end
  
  test "should get index when past category id"  do
    get :index, {:category_id => categories(:A5).id}
    assert_response :success
    assert_not_nil assigns(:notes)
    assert_equal 2, assigns(:notes).size 
  end
  

  test "should create note" do
    assert_difference('Note.count', 1) do
      post :create, {note: @note.attributes}, {:user_id => users(:xueyuan)}
    end
    assert_redirected_to notes_path
  end

  test "should get edit" do
    get :edit, {id: notes(:two)}, {:user_id => users(:xueyuan)}
    assert_response :success
  end

  test "should update note" do
    put :update, {id: notes(:two), note: @note.attributes}, {:user_id => users(:xueyuan)}
    assert_redirected_to notes_path
  end

  test "should destroy note" do
    assert_difference('Note.count', -1) do
      delete :destroy, {id: notes(:two)}, {:user_id => users(:xueyuan)}
    end
    assert_redirected_to notes_path
  end
end
