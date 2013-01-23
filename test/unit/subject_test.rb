# -*- encoding : utf-8 -*-
require 'test_helper'

class SubjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  setup do
    @subject = subjects(:one)
  end
  test "the truth" do
    assert true
  end

  test "title length should in 1..20" do
    @subject.title = ""
    assert !@subject.save
    
    @subject.title = "我"*21
    assert !@subject.save
    
  end
  
  test "order number should be integer and in 0..10000" do
    @subject.order_number = -1
    assert !@subject.save
    
    @subject.order_number = 0    
    assert @subject.save

    @subject.order_number = 10000    
    assert @subject.save

    @subject.order_number = 10001    
    assert !@subject.save
    
    @subject.order_number = "w"
    assert !@subject.save
        
  end

  test "cheers should be integer" do
    @subject.cheers = "w"
    assert !@subject.save
    
    @subject.cheers = -1
    assert !@subject.save
    
    @subject.cheers = 1.5
    assert !@subject.save
  end
  
  
end
