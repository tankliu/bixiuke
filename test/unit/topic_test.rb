# -*- encoding : utf-8 -*-
require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  setup do
    @topic = topics(:one)
  end
  test "the truth" do
    assert true
  end
  
  
  test "length should be" do
    {:title => 1..50, :content => 10..100000}.each do |key, value|
        arg_array = []
        if value.instance_of?(Fixnum)
          arg_array << "课"*(value+1)
        else 
          arg_array << "课"*(value.first-1)  << "课"*(value.last+1)
        end
        arg_array.each do |arg|
          @topic.send((key.to_s + "=").to_sym, arg)
          assert !@topic.save
        end
        @topic = topic.first
    end
    
  end
  
end
