# -*- encoding : utf-8 -*-

require 'test_helper'

class ResourceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @resource = resources(:one)
  end
  
  test "length should be" do
    {:title => 1..100, :download_link => 1..5000}.each do |key, value|
        arg_array = []
        if value.instance_of?(Fixnum)
          arg_array << "课"*(value+1)
        else 
          arg_array << "课"*(value.first-1)  << "课"*(value.last+1)
        end
        arg_array.each do |arg|
          @resource.send((key.to_s + "=").to_sym, arg)
          assert !@resource.save
        end
        @resource = Resource.first
    end
  end
  


end
