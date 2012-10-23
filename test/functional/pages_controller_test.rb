# -*- encoding : utf-8 -*-
require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get guangpan" do
    get :guangpan
    assert_response :success
  end

  test "should get baodao" do
    get :baodao
    assert_response :success
  end

  
end
