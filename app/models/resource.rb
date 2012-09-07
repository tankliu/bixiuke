# -*- encoding : utf-8 -*-

class Resource < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments, :as => :commable
  paginates_per 10
  validates :title, :length => {:in => 1..100, :message => "标题字数在1到100之间"}
  validates :download_link, :length => {:in => 1..5000, :message => "下载链接字数在1到5000之间"}
  
end
