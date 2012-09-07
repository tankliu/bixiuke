# -*- encoding : utf-8 -*-
class Group < ActiveRecord::Base
  belongs_to :user
  has_many :topics
  validates :name, :length => {:in => 1..20, :message => "小组字数长度在1到20之间"}
  validates :description, :length => {:in => 1..100000, :message => "描述字数在1到10万之间"}
  
  Paperclip.interpolates :image_date do |image, style|
    image.instance.image_updated_at.to_date.to_s[0,7]
  end
  
  #TODO:,图片如何加水印
  
  has_attached_file :image,   
          :styles => {:thumb => '100x100'},
          :path => ":rails_root/public/system/:class/:attachment/#{Date.today.to_s[0,7]}/:style/:hash.:extension",
          :url => "/system/:class/:attachment/:image_date/:style/:hash.:extension",
          :hash_secret => "secretisnosecret"
      
   # filetype
  # TODO:必须有image验证
  
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/gif', 'image/bmp','image/pjepg', 'image/x-png'], :message => "图片格式只能为jpg,png,gif,bmp", :unless => "image.original_filename.blank?"
  
  # and size
  validates_attachment_size :image, :less_than => 500.kilobytes, :message => "图片大小不能超过500kb", :unless => "image.original_filename.blank?"
  
end
