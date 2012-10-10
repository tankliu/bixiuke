# -*- encoding : utf-8 -*-
require 'test_helper'

class DiscussionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @discussion = discussions(:one)
  end

  
  test "length should be" do
    {:content => 1..138}.each do |key, value|
        arg_array = []
        if value.instance_of?(Fixnum)
          arg_array << "课"*(value+1)
        else 
          arg_array << "课"*(value.first-1)  << "课"*(value.last+1)
        end
        arg_array.each do |arg|
          @discussion.send((key.to_s + "=").to_sym, arg)
          assert !@discussion.save
        end
        @discussion = Discussion.first
    end
    
  end

end
