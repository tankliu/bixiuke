# -*- encoding : utf-8 -*-
require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  setup do
    @person = Person.new(:name => "dahualang", :password => "123456", :password_confirmation  => "123456", :nick_name => "大狼", :city => "广州")
    @person.role = ""  
  end
  
  test "the truth" do
    assert true
  end
  
  test "should be presence" do
    [:name, :nick_name, :password, :city].each do |method|
      @person.send((method.to_s + "=").to_sym, "")
      assert !@person.save
      @person = Person.first
    end
  end
  
  
  
  test "allow blank true" do
    [:role, :height, :shape, :score, :age, :education, :job, :salary, :marriage].each do |method|
      @person.send((method.to_s + "=").to_sym, "")
    end
    assert @person.save
  end
  
  
  test "length should be" do
    {:name => 2..20, :password => 6..16, :nick_name => 1..10, :job => 2..10}.each do |key, value|
        arg_array = []
        if value.instance_of?(Fixnum)
          arg_array << "课"*(value+1)
        else 
          arg_array << "课"*(value.first-1)  << "课"*(value.last+1)
        end
        arg_array.each do |arg|
          @person.send((key.to_s + "=").to_sym, arg)
          assert !@person.save
        end
        @person = Person.first
    end
    
  end
    
  test "should be in inclusion" do
    {:shape => %w(骨感 中等 有型 肥胖), :education => %w(没上学 小学 初中 高中 专科 本科 硕士 博士 博士后 留学), :marriage => %w(未婚 已婚)}.each do |key, value|
      @person.send((key.to_s + "=").to_sym, "没有的值")
      assert !@person.save
      @person = Person.first
    end
    
  end
   

  test "should be integer and in a range" do
    {:height => 140..230, :score => 1..10, :age => 16..60, :salary => 1000..10000000}.each do |key, value|
      @person.send((key.to_s + "=").to_sym, "w")
      assert !@person.save
      @person.send((key.to_s + "=").to_sym, value.first-1)
      assert !@person.save
      @person.send((key.to_s + "=").to_sym, value.last+1)
      assert !@person.save
      
      @person = Person.first
    end
  end

  test "name should be uniqueness" do
    person2 = @person.clone    
    @person.save 
    assert !person2.save  
  end
 
  test "password should be the same" do
    @person.password = "123456"
    @person.password_confirmation = "654321"
    assert !@person.save
  end
  

  test "role should be blank string on create" do
    @person.role = "学员"
    assert !@person.save
    
    @person.role = "老师"
    assert !@person.save
  end
  
  test "role should be in" do
    @person.save
    @person.role = "教师"
    assert !@person.save
    
    @person.role = "老师"
    assert @person.save
    
    @person.role = "学员"
    assert @person.save
  end
  
  
  test "person save success" do
    @person = Person.new(:name => "xiaohualang", :password => "123456", :password_confirmation  => "123456", :nick_name => "大狼", :city => "广州")
    @person.role = ""
    assert_difference "Person.count", +1 do
      @person.save
    end
  end
  

end
