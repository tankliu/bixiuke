# -*- encoding : utf-8 -*-
class Classroom < ActiveRecord::Base
  belongs_to :person
  has_many :discussions, :dependent => :destroy
  validates :name, :length => {:in => 1..20, :message => "小组字数长度在1到20之间"}
  validates :description, :length => {:in => 1..100000, :message => "描述字数在1到10万之间"}
  
  Paperclip.interpolates :avatar_date do |avatar, style|
    avatar.instance.avatar_updated_at.to_date.to_s[0,7]
  end
  
  #TODO:,图片如何加水印
  
  has_attached_file :avatar,   
          :styles => {:medium => '50x50'},
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
