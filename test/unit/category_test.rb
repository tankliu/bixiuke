# -*- encoding : utf-8 -*-

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @category = categories(:A1)
  end
  test "the truth" do
    assert true
  end

  test "name length should in 1..20" do
    @category.name = ""
    assert !@category.save
    
    @category.name = "我"*21
    assert !@category.save
    
  end
  
  test "order number should be integer and in 0..10000" do
    @category.order_number = -1
    assert !@category.save
    
    @category.order_number = 0    
    assert @category.save

    @category.order_number = 10000    
    assert @category.save

    @category.order_number = 10001    
    assert !@category.save
    
    @category.order_number = "w"
    assert !@category.save
        
  end
  
  test "typeable should be in [Article,Resource,Note]" do
    Typeable = %w(Article Resource Note)
    Typeable.each do |t|
      @category.typeable = t
      assert @category.save
    end
    @category.typeable = "Another"
    assert !@category.save
    
  end
  
end
