# -*- encoding : utf-8 -*-
class Note < ActiveRecord::Base
  belongs_to :person
  belongs_to :category
  has_many :comments, :as => :commable
  paginates_per 10
  validates :content, :length => {:in => 10..500, :too_short => "惯例内容至少10个字", :too_long => "写的太多了，请简明扼要，字数限制500,多了不方便阅读和排版"}

  # before_save :add_color_to_tag
  # 
  #  protected
  #  def add_color_to_tag
  #    tag_match_data            = self.content.match(/@\S*/) 
  #    if tag_match_data
  #      tag                     = tag_match_data[0]
  #      self.content            = self.content.sub!(tag, "<span class='usage_pinglun'>#{tag}</span>")
  #    end
  #  end
end
