# -*- encoding : utf-8 -*-
class Option < ActiveRecord::Base
  belongs_to :testing
  validates :content, :length => {:in => 1..100000, :message => "选项字数请控制1到500字"}
      
end
