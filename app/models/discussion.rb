# -*- encoding : utf-8 -*-
class Discussion < ActiveRecord::Base
  
  belongs_to :person
  belongs_to :classroom
  # has_many :comments, :as => :commable
  #自关联
  validates :content, :length => {:in => 1..138, :message => "描述字数在1到140之间"}
  
  paginates_per 100
  
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

