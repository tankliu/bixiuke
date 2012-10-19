# -*- encoding : utf-8 -*-
class Category < ActiveRecord::Base
  # attr_accessible :title, :body
  # has_many :notes
  has_many :articles
  has_many :resources
  has_many :notes
  has_many :topics
  
  validates :name, :length => {:in => 1..20, :message => "标题字数长度在1到50之间"}
  validates :path, :length => {:in => 1..20, :message => "url字数长度在1到50之间"}
  validates :order_number, :numericality => {:greater_than_or_equal_to => 0,:less_than_or_equal_to => 10000, :only_integer => true, :message => "必须是0到10000的整数"}
  validates :typeable, :inclusion => {:in => %w(Article Resource Note), :message => "类别的类型只能是Article,Resource,Note"}
  
  
  Paperclip.interpolates :avatar_date do |avatar, style|
    avatar.instance.avatar_updated_at.to_date.to_s[0,7]
  end
  
  #TODO:,图片如何加水印
  
  has_attached_file :avatar,   
          :styles => {:thumb => "25x25",:medium => '50x50'},
          :path => ":rails_root/public/system/:class/:attachment/#{Date.today.to_s[0,7]}/:style/:hash.:extension",
          :url => "/system/:class/:attachment/:avatar_date/:style/:hash.:extension",
          :hash_data  =>  ":id/:style/:updated_at",
          :hash_secret => "secretisnosecret"
      
   # filetype
  # TODO:必须有avatar验证
  
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png', 'image/gif', 'image/bmp','image/pjepg', 'image/x-png'], :message => "图片格式只能为jpg,png,gif,bmp", :unless => "avatar.original_filename.blank?"
  
  # and size
  validates_attachment_size :avatar, :less_than => 500.kilobytes, :message => "图片大小不能超过500kb", :unless => "avatar.original_filename.blank?"

  
  
end
