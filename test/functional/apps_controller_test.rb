# -*- encoding : utf-8 -*-
require 'test_helper'

class AppsControllerTest < ActionController::TestCase
  setup do
    @app = apps(:one)
  end

  test "should not create and update and destroy if person is not log in" do
    get :edit, {:id => @app}
    assert_redirected_to login_url
    post :create, {:app => @app.attributes}
    assert_redirected_to login_url
    put :update, {:id => @app, :app => @app.attributes}
    assert_redirected_to login_url
    delete :destroy, {:id => @app}
    assert_redirected_to login_url
    
  end
  
  test "should not create and update and destroy if person is not member " do
    get :edit, {:id => @app}, {:person_id => people(:youke).id}
    assert_redirected_to xueyuan_path
    post :create, {:app => @app.attributes}, {:person_id => people(:youke).id}
    assert_redirected_to xueyuan_path
    put :update, {:id => @app, :app => @app.attributes}, {:person_id => people(:youke).id}
    assert_redirected_to xueyuan_path    
    delete :destroy, {:id => @app}, {:person_id => people(:youke).id}
    assert_redirected_to xueyuan_path
    
  end
  
  test "should not update and destroy if app is not belong to person" do
    assert_raise(ActiveRecord::RecordNotFound) {get :edit, {:id => @app}, {:person_id => people(:xueyuan).id}}
    assert_raise(ActiveRecord::RecordNotFound) {put :update, {:id => @app, :app => @app.attributes}, {:person_id => people(:xueyuan).id}}
    assert_raise(ActiveRecord::RecordNotFound) {delete :destroy, {:id => @app}, {:person_id => people(:xueyuan).id}}
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apps)
  end
  

  test "should create app" do
    assert_difference('App.count', 1) do
      post :create, {app: apps(:two).attributes}, {:person_id => people(:xueyuan)}
    end
    assert_redirected_to apps_path
  end

  test "should get edit" do
    get :edit, {id: apps(:two)}, {:person_id => people(:xueyuan)}
    assert_response :success
  end

  test "should update app" do
    put :update, {id: apps(:two), app: @app.attributes}, {:person_id => people(:xueyuan)}
    assert_redirected_to apps(:two)
  end

  test "should destroy app" do
    assert_difference('App.count', -1) do
      delete :destroy, {id: apps(:two)}, {:person_id => people(:xueyuan)}
    end
    assert_redirected_to apps_path
  end
end
