# -*- encoding : utf-8 -*-
class Discussion < ActiveRecord::Base
  belongs_to :user
  belongs_to :classroom
  # has_many :comments, :as => :commable
  #自关联
  validates :content, :length => {:in => 1..140, :message => "描述字数在1到140之间"}
  
  paginates_per 100
  
  
end

