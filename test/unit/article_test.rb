# -*- encoding : utf-8 -*-
require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  setup do
    @article = articles(:one)
  end

  
  test "length should be" do
    {:title => 1..100, :description => 1..100000, :content => 1..100000}.each do |key, value|
        arg_array = []
        if value.instance_of?(Fixnum)
          arg_array << "课"*(value+1)
        else 
          arg_array << "课"*(value.first-1)  << "课"*(value.last+1)
        end
        arg_array.each do |arg|
          @article.send((key.to_s + "=").to_sym, arg)
          assert !@article.save
        end
        @article = Article.first
    end
    
  end
  
  test "views should be integer" do
    @article.views = "w"
    assert !@article.save
    
    @article.views = -1
    assert !@article.save
    
    @article.views = 1.5
    assert !@article.save
  end
  
  
end
