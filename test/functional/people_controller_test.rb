# -*- encoding : utf-8 -*-
require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  setup do
    @person = people(:youke)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:people)
  end
  

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should not create person with mass-assignment" do
    assert_no_difference('Person.count') do
      assert_raise(ActiveModel::MassAssignmentSecurity::Error) {post :create, person: @person.attributes}
    end
  end
  
  test "should create person with no mass-assignment" do
    assert_difference('Person.count', 1) do
      post :create, :person => {:name => "xiaohualang", :password => "123456", :password_confirmation  => "123456", :nick_name => "大狼", :city => "广州"}
    end    
    assert_not_nil assigns(:person)
    # raise assigns(:person).errors.full_messages.to_s
    #    assert_redirected_to person_path(assigns(:person))
  end
  

  test "should show person" do
    get :show, id: @person
    assert_response :success
  end
  
  test "should not get edit if it is not log in" do
    get :edit, {id: @person}, nil
    assert_response :redirect
    assert_redirected_to login_url
    
  end
  
  test "should get edit" do
    get :edit, {id: @person}, {:person_id => @person.id}
    assert_response :success
  end
  
  test "should not update if it is not log in" do
    put :update, {:id => @person.id, :password => "123456", :password_confirmation  => "123456", :nick_name => "大狼", :city => "广州"}, nil
    assert_redirected_to login_url
  end
  
  test "should get the current_person if want to edit another person" do
    get :edit, {id: @person}, {:person_id => people(:xueyuan).id}
    assert_equal assigns(:person).id, people(:xueyuan).id
    assert_response :success
    #redirect_to show
  end

  
  test "should not update person with mass-assignment" do
    assert_raise(ActiveModel::MassAssignmentSecurity::Error) {put :update, {id: @person, person: @person.attributes}, {:person_id => @person.id}}
  end
  
  test "should update current_use if want to edit another person" do
    put :update, {:id => @person.id, :password => "123456", :password_confirmation  => "123456", :nick_name => "大狼", :city => "广州"}, {:person_id => people(:xueyuan).id}
    assert_equal assigns(:person).id, people(:xueyuan).id
    assert_response :redirect
  end
  
  
  test "should update person with no mass-assignment and if it is the same person" do
    put :update, {:id => @person.id, :password => "123456", :password_confirmation  => "123456", :nick_name => "大狼", :city => "广州"}, {:person_id => @person.id}
    assert_not_nil assigns(:person)
    assert_redirected_to person_path(assigns(:person))
  end
  
  
  test "should not destroy person if person is not admin" do
    assert_no_difference "Person.count" do
      delete :destroy, {:id => @person}, {:person_id => people(:xueyuan).id}
    end
    assert_response :redirect
  end
  
  test "should destroy person if it is admin" do
    assert_difference('Person.count', -1) do
      delete :destroy, {id: @person}, {:person_id => people(:admin).id}
    end
    assert_redirected_to people_path
  end
  

  test "should not change_role if person is not admin" do
    put :update, {id: @person, :role => "学员"}, {:person_id => @person.id}
    assert_equal "", assigns(:person).role
  end
  
  test "should change_role" do
    put :update,{:id => @person, :role => "学员"}, {:person_id => people(:admin)}
    assert_equal "学员", assigns(:person).role
  end

  test "should not get new if log in" do
    get :new, nil, {person_id: people(:xueyuan)}
    assert_redirected_to :root
  end
  
  test "should get new if person is admin" do
    get :new, nil, {person_id: people(:admin)}
    assert_response :success
  end
   
end
