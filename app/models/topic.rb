# -*- encoding : utf-8 -*-
class Topic < ActiveRecord::Base
  has_many :comments, :as => :commable
  belongs_to :group
  belongs_to :person
  paginates_per 10
  validates :title, :length => {:in => 1..50, :message => "标题限制1到50字"}
  validates :content, :length => {:in => 10..100000, :too_short => "内容写的太少了", :too_long => "写的太多了，请简洁"}
  
end

