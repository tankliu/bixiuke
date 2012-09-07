# -*- encoding : utf-8 -*-
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.new(:name => "dahualang", :password => "123456", :password_confirmation  => "123456", :nick_name => "大狼", :city => "广州")
    @user.role = ""  
  end
  
  test "the truth" do
    assert true
  end
  
  test "should be presence" do
    [:name, :nick_name, :password, :city].each do |method|
      @user.send((method.to_s + "=").to_sym, "")
      assert !@user.save
      @user = User.first
    end
  end
  
  
  
  test "allow blank true" do
    [:role, :height, :shape, :score, :age, :education, :job, :salary, :marriage].each do |method|
      @user.send((method.to_s + "=").to_sym, "")
    end
    assert @user.save
  end
  
  
  test "length should be" do
    {:name => 2..20, :password => 6..16, :nick_name => 1..20, :job => 2..10}.each do |key, value|
        arg_array = []
        if value.instance_of?(Fixnum)
          arg_array << "课"*(value+1)
        else 
          arg_array << "课"*(value.first-1)  << "课"*(value.last+1)
        end
        arg_array.each do |arg|
          @user.send((key.to_s + "=").to_sym, arg)
          assert !@user.save
        end
        @user = User.first
    end
    
  end
    
  test "should be in inclusion" do
    {:shape => %w(骨感 中等 有型 肥胖), :education => %w(没上学 小学 初中 高中 专科 本科 硕士 博士 博士后 留学), :marriage => %w(未婚 已婚)}.each do |key, value|
      @user.send((key.to_s + "=").to_sym, "没有的值")
      assert !@user.save
      @user = User.first
    end
    
  end
   

  test "should be integer and in a range" do
    {:height => 140..230, :score => 1..10, :age => 16..60, :salary => 1000..10000000}.each do |key, value|
      @user.send((key.to_s + "=").to_sym, "w")
      assert !@user.save
      @user.send((key.to_s + "=").to_sym, value.first-1)
      assert !@user.save
      @user.send((key.to_s + "=").to_sym, value.last+1)
      assert !@user.save
      
      @user = User.first
    end
  end

  test "name should be uniqueness" do
    user2 = @user.clone    
    @user.save 
    assert !user2.save  
  end
 
  test "password should be the same" do
    @user.password = "123456"
    @user.password_confirmation = "654321"
    assert !@user.save
  end
  

  test "role should be blank string on create" do
    @user.role = "学员"
    assert !@user.save
    
    @user.role = "老师"
    assert !@user.save
  end
  
  test "role should be in" do
    @user.save
    @user.role = "教师"
    assert !@user.save
    
    @user.role = "老师"
    assert @user.save
    
    @user.role = "学员"
    assert @user.save
  end
  
  
  test "user save success" do
    @user = User.new(:name => "xiaohualang", :password => "123456", :password_confirmation  => "123456", :nick_name => "大狼", :city => "广州")
    @user.role = ""
    assert_difference "User.count", +1 do
      @user.save
    end
  end
  

end
