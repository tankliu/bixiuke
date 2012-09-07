# -*- encoding : utf-8 -*-
class Subject < ActiveRecord::Base
  belongs_to :user
  has_many :notes
  has_many :topics
  
  validates :title, :length => {:in => 1..20, :message => "标题字数长度在1到50之间"}
  validates :order_number, :numericality => {:greater_than_or_equal_to => 0,:less_than_or_equal_to => 10000, :only_integer => true, :message => "必须是0到10000的整数"}
  validates :cheers, :numericality => {:greater_than_or_equal_to => 0, :only_integer => true, :message => "cheers必须等于大于0"}
  
end
