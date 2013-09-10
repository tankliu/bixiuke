# -*- encoding : utf-8 -*-
class Topic < ActiveRecord::Base
  has_many :comments, :as => :commable, :dependent => :destroy
  belongs_to :categories
  belongs_to :group
  belongs_to :person
  belongs_to :last_replied_person, :class_name => "Person", :foreign_key => "last_replied_by"
  has_many :assets, :dependent => :destroy
  accepts_nested_attributes_for :assets, :allow_destroy => true
  
  has_many :attachments, :conditions => "assets.asset_type = 'attachment'", :class_name => "Asset"
  
  paginates_per 50
  validates :title, :length => {:in => 1..200, :message => "标题限制1到50字"}
  validates :content, :length => {:in => 1..200000, :too_short => "内容写的太少了", :too_long => "写的太多了，请简洁"}
  
  
  
  before_save :change_url
  protected
  def change_url
    match_data            = self.content.match(/\[url\](.+)\[\/url\]/) 
    if match_data
      url                     = match_data[1]  #匹配里面的url
      self.content            = self.content.gsub(match_data[0], "<a href='#{url.include?("http") ? url : "http://"+url}' target='_blank'>#{url}</a>")
    end
  end    
  #      
   
  def find_match_asset(str) 
      a = str
       self.assets.each do |asset|
            if str.include?(asset.image_file_name) 
              a =   "<img src='#{asset.image.url(:medium)}' />" 
            end
       end 
       a
  end
  
end

