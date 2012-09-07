# -*- encoding : utf-8 -*-
class Category < ActiveRecord::Base
  # attr_accessible :title, :body

  # has_many :notes
  has_many :articles
  has_many :resources
  has_many :notes
  has_many :topics
  validates :name, :length => {:in => 1..20, :message => "标题字数长度在1到50之间"}
  validates :order_number, :numericality => {:greater_than_or_equal_to => 0,:less_than_or_equal_to => 10000, :only_integer => true, :message => "必须是0到10000的整数"}
  validates :typeable, :inclusion => {:in => %w(Article Resource Note), :message => "类别的类型只能是Article,Resource,Note"}
  
end
