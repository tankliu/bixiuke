# -*- encoding : utf-8 -*-
class Testing < ActiveRecord::Base
  belongs_to :person
  has_many :options, :dependent => :destroy
  paginates_per 10
  
  has_many :comments, :as => :commable
  validates :title, :length => {:in => 1..100, :message => "标题字数在1到50之间"}  
  validates :content, :length => {:in => 1..100000, :too_short => "内容写的太少了", :too_long => "写的太多了，请简洁"}
  
end
