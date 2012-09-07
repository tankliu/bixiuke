# -*- encoding : utf-8 -*-
require 'test_helper'

class NoteTest < ActiveSupport::TestCase

  test "the truth" do
    assert true
  end
  
  test "content length should be in 10..500" do
    note = notes(:one)
    note.content = "欧"*9
    assert !note.save
    
    note.content = "我"*501
    assert !note.save
    
  end
  
  test "add_color_to_tag" do
    note = notes(:one)
    note.content = note.content + " @适合酒吧,搭讪 "
    assert note.save
    assert note.content.include?("<span class='note_pinglun'>@适合酒吧,搭讪</span>")
    
  end
end
