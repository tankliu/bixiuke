# -*- encoding : utf-8 -*-
require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @comment = comments(:one)
  end

  
  test "length should be" do
    {:content => 1..100000}.each do |key, value|
        arg_array = []
        if value.instance_of?(Fixnum)
          arg_array << "课"*(value+1)
        else 
          arg_array << "课"*(value.first-1)  << "课"*(value.last+1)
        end
        arg_array.each do |arg|
          @comment.send((key.to_s + "=").to_sym, arg)
          assert !@comment.save
        end
        @comment = Comment.first
    end
    
  end  

end
