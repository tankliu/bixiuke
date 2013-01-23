# -*- encoding : utf-8 -*-
require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  
  setup do
    @course = courses(:one)
  end

  test "should be presence" do
    [:name, :category, :start_date, :end_date, :city, :teacher].each do |method|
      @course.send((method.to_s + "=").to_sym, "")
      assert !@course.save
      @course = Course.first
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
          @course.send((key.to_s + "=").to_sym, arg)
          assert !@course.save
        end
        @course = Course.first
    end
    
  end
    
  test "allow blank true" do
    [:holiday, :top_number, :now_number, :cost, :discount, :discount_requirement, :deposite].each do |method|
      @course.send((method.to_s + "=").to_sym, "")
    end
    assert @course.save
  end
  
  test "top_number should be integer and less than" do
    {:top_number => 10000, :now_number => 10000, :cost => 100000, :discount => 100000, :deposite => 100000}.each do |key, value|
      @course.send((key.to_s + "=").to_sym, "w")
      assert !@course.save
      @course.send((key.to_s + "=").to_sym, value+1)
      assert !@course.save
      @course = Course.first
    end
    
  end
  
  test "cost should be presence if dicount or deposite is not blank" do
    @course.cost = ""
    @course.discount = 1
    assert !@course.save

    @course.discount = ""
    @course.deposite = 1
    assert !@course.save
  end
  
  test "discount should be presence if discount_requirement" do
    @course.discount = ""
    @course.discount_requirement = "wo"
    assert !@course.save

  end
  
  test "compare top_number and now_number" do
    @course.top_number = 8
    @course.now_number = 9
    assert !@course.save
    @course.now_number = 8
    assert @course.save
  end

  test "compare cost and discount" do
    @course.cost = 100
    @course.discount = 101
    @course.deposite = 100
    assert !@course.save
    
    @course.discount = 100
    @course.deposite = 101
    assert !@course.save
    
    @course.discount = @course.deposite = 100
    assert @course.save
  end
  
  test "compare start_date and end_date" do
    @course.start_date = "2012-02-12"
    @course.end_date = "2012-02-12"
    assert @course.save
    
    @course.end_date = "2012-02-11"
    assert !@course.save
  end
  

  
  test "remain_days" do

    @course.start_date = 4.days.from_now.to_s(:db)
    @course.end_date = 11.days.from_now.to_s(:db)
    assert_equal 4, @course.remain_days
    
    @course.start_date = Date.current.to_s(:db)
    @course.end_date = 4.days.from_now.to_s(:db)
    assert_equal "培训中", @course.remain_days
    
    @course.start_date = 10.days.ago.to_s(:db)
    @course.end_date = 3.days.ago.to_s(:db)
    assert_equal "培训完", @course.remain_days
  end
  
  
end
