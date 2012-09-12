# -*- encoding : utf-8 -*-
require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  setup do
    @article = articles(:one)
  end
  
  test "should not get new and edit if person is not log in" do
    get :new
    assert_redirected_to login_url
    get :edit, {:id => @article}
    assert_redirected_to login_url
    post :create, {:article => @article.attributes}
    assert_redirected_to login_url
    put :update, {:id => @article, :article => @article.attributes}
    assert_redirected_to login_url
    delete :destroy, {:id => @article}
    assert_redirected_to login_url
  end
  
  
  test "should not create and update and destroy if person is not admin " do
    get :new, nil, {:person_id => people(:xueyuan).id}
    assert_redirected_to :root
    get :edit, {:id => @article}, {:person_id => people(:xueyuan).id}
    assert_redirected_to :root
    post :create, {:article => @article.attributes}, {:person_id => people(:xueyuan).id}
    assert_redirected_to :root
    put :update, {:id => @article, :article => @article.attributes}, {:person_id => people(:xueyuan).id}
    assert_redirected_to :root    
    delete :destroy, {:id => @article}, {:person_id => people(:xueyuan).id}
    assert_redirected_to :root
    
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:articles)
  end


  test "should show article" do
    get :show, :id => @article
    assert_response :success
  end


  test "get new" do
    get :new, nil, {:person_id => people(:admin).id}
    assert_response :success
    
    get :new, nil, {:person_id => people(:xueyuan).id}
    assert_response :redirect
    
  end

  test "should not create article if person is not admin" do
    assert_no_difference('Article.count') do
      post :create, {:article => @article.attributes}, {:person_id => people(:xueyuan).id}
    end
    assert_redirected_to :root
  end
  
  test "should create article if person is admin" do
    assert_difference('Article.count', 1) do
      post :create, {:article => @article.attributes}, {:person_id => people(:admin).id}
    end
    assert_redirected_to article_path(assigns(:article))
  end


  test "should not get edit is person is not admin" do
    get :edit, {:id => @article}, {:person_id => people(:xueyuan).id}
    assert_redirected_to :root
  end
  

  test "should get edit" do  
    get :edit, {:id => @article}, {:person_id => people(:admin).id}
    assert_response :success
  end
  

  test "should not update article is person is not admin" do
    put :update, {:id => @article, :article => @article.attributes},{:person_id => people(:xueyuan).id}
    assert_redirected_to :root
  end
  
  test "should update article if person is admin" do
    put :update, {:id => @article, :article => @article.attributes},{:person_id => people(:admin).id}
    assert_redirected_to article_path(assigns(:article))
  end

  test "should not destroy article if person is not admin" do
    assert_no_difference('Article.count') do
      delete :destroy, {:id => @article}, {:person_id => people(:xueyuan).id}
    end
    assert_redirected_to :root
  end
  
  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete :destroy, {:id => @article}, {:person_id => people(:admin).id}
    end
    assert_redirected_to articles_path
  end
end
