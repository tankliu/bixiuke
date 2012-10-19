# -*- encoding : utf-8 -*-
require 'test_helper'

class AppTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  setup do
    @app = apps(:one)
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
          @app.send((key.to_s + "=").to_sym, arg)
          assert !@app.save
        end
        @app = App.first
    end
  end
  
end
