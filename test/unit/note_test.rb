# -*- encoding : utf-8 -*-
require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  setup do
    @note = notes(:one)
  end

  test "the truth" do
    assert true
  end
  
  test "length should be" do
    {:title => 1..50, :content => 10..1000}.each do |key, value|
        arg_array = []
        if value.instance_of?(Fixnum)
          arg_array << "课"*(value+1)
        else 
          arg_array << "课"*(value.first-1)  << "课"*(value.last+1)
        end
        arg_array.each do |arg|
          @note.send((key.to_s + "=").to_sym, arg)
          assert !@note.save
        end
        @note = note.first
    end
    
  end
  
  
  
  test "add_color_to_tag" do
    note = notes(:one)
    note.content = note.content + " @适合酒吧,搭讪 "
    assert note.save
    assert note.content.include?("<span class='usage_pinglun'>@适合酒吧,搭讪</span>")
    
  end
end
