# -*- encoding : utf-8 -*-
class Topic < ActiveRecord::Base
  has_many :comments, :as => :commable
  belongs_to :group
  belongs_to :person
  belongs_to :last_replied_person, :class_name => "Person", :foreign_key => "last_replied_by"
  paginates_per 10
  validates :title, :length => {:in => 1..50, :message => "标题限制1到50字"}
  validates :content, :length => {:in => 10..100000, :too_short => "内容写的太少了", :too_long => "写的太多了，请简洁"}

  before_save :change_url

  
  protected
  def change_url
    match_data            = self.content.match(/\[url\](.+)\[\/url\]/) 
    if match_data
      url                     = match_data[1]  #匹配里面的url
      self.content            = self.content.gsub(match_data[0], "<a href='#{url.include?("http") ? url : "http://"+url}' target='_blank'>#{url}</a>")
    end
  end
  

    
end

