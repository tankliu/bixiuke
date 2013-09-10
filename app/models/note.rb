# -*- encoding : utf-8 -*-
class Note < ActiveRecord::Base
  belongs_to :person
  belongs_to :category
  has_many :comments, :as => :commable
  paginates_per 10
  validates :title, :length => {:in => 1..50, :message => "标题限制1到50字"}
  validates :content, :length => {:in => 10..1000, :too_short => "惯例内容至少10个字", :too_long => "写的太多了，请简明扼要，字数限制500"}

  
  def remove_hint_span
    self.content = self.content.gsub(/<span\sclass=\'usage_pinglun\'>/,"").gsub(/<\/span>/,"")
  end
  
  before_save :add_color_to_tag, :change_url

  protected
  def add_color_to_tag
    tag_match_data            = self.content.match(/@\S*/) 
    if tag_match_data
      tag                     = tag_match_data[0]
      self.content            = self.content.sub!(tag, "<span class='usage_pinglun'>#{tag}</span>")
    end
  end

  def change_url
    match_data            = self.content.match(/\[url\](.+)\[\/url\]/) 
    if match_data
      url                     = match_data[1]  #匹配里面的url
      self.content            = self.content.gsub(match_data[0], "<a href='#{url.include?("http") ? url : "http://"+url}' target='_blank'>#{url}</a>")
    end
  end
  
end
