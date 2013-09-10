# -*- encoding : utf-8 -*-
class Comment < ActiveRecord::Base
  belongs_to :person
  belongs_to :commable, :polymorphic=> true
  validates :content, :length => {:in => 1..100000, :message => "评论字数太少或太多"}
  
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
