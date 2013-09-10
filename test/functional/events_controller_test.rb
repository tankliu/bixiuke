# -*- encoding : utf-8 -*-
require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
  end
  
  test "should not get new and edit if person is not log in" do
    get :new
    assert_redirected_to login_url
    get :edit, {:id => @event}
    assert_redirected_to login_url
    post :create, {:event => @event.attributes}
    assert_redirected_to login_url
    put :update, {:id => @event, :event => @event.attributes}
    assert_redirected_to login_url
    delete :destroy, {:id => @event}
    assert_redirected_to login_url
  end
  
  
  test "should not create and update and destroy if person is not admin " do
    get :new, nil, {:person_id => people(:xueyuan).id}
    assert_redirected_to :root
    get :edit, {:id => @event}, {:person_id => people(:xueyuan).id}
    assert_redirected_to :root
    post :create, {:event => @event.attributes}, {:person_id => people(:xueyuan).id}
    assert_redirected_to :root
    put :update, {:id => @event, :event => @event.attributes}, {:person_id => people(:xueyuan).id}
    assert_redirected_to :root    
    delete :destroy, {:id => @event}, {:person_id => people(:xueyuan).id}
    assert_redirected_to :root
    
  end
  
  
  
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "get new" do
    get :new, nil, {:person_id => people(:admin).id}
    assert_response :success
    
    get :new, nil, {:person_id => people(:xueyuan).id}
    assert_response :redirect
    
  end

  test "should not create event if person is not admin" do
    assert_no_difference('Event.count') do
      post :create, {:event => @event.attributes}, {:person_id => people(:xueyuan).id}
    end
    assert_redirected_to :root
  end
  
  test "should create event if person is admin" do
    assert_difference('Event.count', 1) do
      post :create, {:event => @event.attributes}, {:person_id => people(:admin).id}
    end
    assert_redirected_to events_path
  end

  test "should not get edit is person is not admin" do
    get :edit, {:id => @event}, {:person_id => people(:xueyuan).id}
    assert_redirected_to :root
  end
  

  test "should get edit" do  
    get :edit, {:id => @event}, {:person_id => people(:admin).id}
    assert_response :success
  end
  

  test "should not update event is person is not admin" do
    put :update, {:id => @event, :event => @event.attributes},{:person_id => people(:xueyuan).id}
    assert_redirected_to :root
  end
  
  test "should update event if person is admin" do
    put :update, {:id => @event, :event => @event.attributes},{:person_id => people(:admin).id}
    assert_redirected_to events_path
  end

  test "should not destroy event if person is not admin" do
    assert_no_difference('Event.count') do
      delete :destroy, {:id => @event}, {:person_id => people(:xueyuan).id}
    end
    assert_redirected_to :root
  end
  
  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, {:id => @event}, {:person_id => people(:admin).id}
    end
    assert_redirected_to events_path
  end
end
