# -*- encoding : utf-8 -*-
require 'test_helper'

class EventTest < ActiveSupport::TestCase
  
  setup do
    @event = events(:one)
  end

  test "should be presence" do
    [:name, :category, :start_date, :end_date, :city, :teacher].each do |method|
      @event.send((method.to_s + "=").to_sym, "")
      assert !@event.save
      @event = Event.first
    end
  end
  
  test "length should be" do
    {:name => 1..20, :category => 1..20, :holiday => 10, :city => 2..4, :teacher => 1..20, :discount_requirement => 50}.each do |key, value|
        arg_array = []
        if value.instance_of?(Fixnum)
          arg_array << "课"*(value+1)
        else 
          arg_array << "课"*(value.first-1)  << "课"*(value.last+1)
        end
        arg_array.each do |arg|
          @event.send((key.to_s + "=").to_sym, arg)
          assert !@event.save
        end
        @event = Event.first
    end
    
  end
    
  test "allow blank true" do
    [:holiday, :top_number, :now_number, :cost, :discount, :discount_requirement, :deposite].each do |method|
      @event.send((method.to_s + "=").to_sym, "")
    end
    assert @event.save
  end
  
  test "top_number should be integer and less than" do
    {:top_number => 10000, :now_number => 10000, :cost => 100000, :discount => 100000, :deposite => 100000}.each do |key, value|
      @event.send((key.to_s + "=").to_sym, "w")
      assert !@event.save
      @event.send((key.to_s + "=").to_sym, value+1)
      assert !@event.save
      @event = Event.first
    end
    
  end
  
  test "cost should be presence if dicount or deposite is not blank" do
    @event.cost = ""
    @event.discount = 1
    assert !@event.save

    @event.discount = ""
    @event.deposite = 1
    assert !@event.save
  end
  
  test "discount should be presence if discount_requirement" do
    @event.discount = ""
    @event.discount_requirement = "wo"
    assert !@event.save

  end
  
  test "compare top_number and now_number" do
    @event.top_number = 8
    @event.now_number = 9
    assert !@event.save
    @event.now_number = 8
    assert @event.save
  end

  test "compare cost and discount" do
    @event.cost = 100
    @event.discount = 101
    @event.deposite = 100
    assert !@event.save
    
    @event.discount = 100
    @event.deposite = 101
    assert !@event.save
    
    @event.discount = @event.deposite = 100
    assert @event.save
  end
  
  test "compare start_date and end_date" do
    @event.start_date = "2012-02-12"
    @event.end_date = "2012-02-12"
    assert @event.save
    
    @event.end_date = "2012-02-11"
    assert !@event.save
  end
  

  
  test "remain_days" do

    @event.start_date = 4.days.from_now.to_s(:db)
    @event.end_date = 11.days.from_now.to_s(:db)
    assert_equal 4, @event.remain_days
    
    @event.start_date = Date.current.to_s(:db)
    @event.end_date = 4.days.from_now.to_s(:db)
    assert_equal "培训中", @event.remain_days
    
    @event.start_date = 10.days.ago.to_s(:db)
    @event.end_date = 3.days.ago.to_s(:db)
    assert_equal "培训完", @event.remain_days
  end
  
  
end
