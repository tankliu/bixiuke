# -*- encoding : utf-8 -*-

class Resource < ActiveRecord::Base
  belongs_to :person
  belongs_to :category
  has_many :comments, :as => :commable
  paginates_per 50
  validates :category_id, :presence => {:message  => "请填写类别"}
  validates :title, :length => {:in => 1..100, :message => "标题字数在1到100之间"},
          :uniqueness => {:message => "已经存在一样的资源", :allow_blank => true}
  
  validates :download_link, :length => {:in => 1..5000, :message => "下载链接字数在1到5000之间"}
  
  
end
