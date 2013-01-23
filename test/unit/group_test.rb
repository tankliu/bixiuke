# -*- encoding : utf-8 -*-
require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @group = groups(:one)
  end

  
  test "length should be" do
    {:name => 1..20, :description => 1..100000}.each do |key, value|
        arg_array = []
        if value.instance_of?(Fixnum)
          arg_array << "课"*(value+1)
        else 
          arg_array << "课"*(value.first-1)  << "课"*(value.last+1)
        end
        arg_array.each do |arg|
          @group.send((key.to_s + "=").to_sym, arg)
          assert !@group.save
        end
        @group = Group.first
    end
    
  end
  
end
