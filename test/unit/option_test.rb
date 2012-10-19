# -*- encoding : utf-8 -*-
require 'test_helper'

class OptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @option = options(:one)
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
          @option.send((key.to_s + "=").to_sym, arg)
          assert !@option.save
        end
        @option = Option.first
    end
    
  end  
  
  
end
