# -*- encoding : utf-8 -*-
class Article < ActiveRecord::Base
  has_many :comments, :as => :commable
  belongs_to :person
  belongs_to :category
  paginates_per 10

  validates :title, :length => {:in => 1..100, :message => "标题字数长度在1到100之间"}
  validates :description, :length => {:in => 1..100000, :message => "描述字数在1到10万之间"}
  validates :content, :length => {:in => 1..100000,:message => "文章内容字数必须在1到10万之间"}
  validates :views, :numericality => {:greater_than_or_equal_to => 0, :only_integer => true, :message => "浏览次数必须是整数"}
  

  Paperclip.interpolates :attachment_file_name do |attachment, style|
    attachment.instance.attachment_file_name
  end
  
  Paperclip.interpolates :date do |attachment, style|
    attachment.instance.attachment_updated_at.to_date.to_s[0,7]
  end
  
  #TOOD:,图片如何加水印
  
  has_attached_file :attachment,     
          :path => ":rails_root/public/system/:class/:attachment/#{Date.today.to_s[0,7]}/:attachment_file_name",
          :url => "/system/:class/:attachment/:date/:filename"
      
   # filetype
  validates_attachment_content_type :attachment, :content_type => ['image/jpeg', 'image/png', 'image/gif', 'image/bmp','image/pjepg', 'image/x-png'], :message => "图片格式只能为jpg,png,gif,bmp", :unless => "attachment.original_filename.blank?"
  # and size
  validates_attachment_size :attachment, :less_than => 500.kilobytes, :message => "图片大小不能超过500kb", :unless => "attachment.original_filename.blank?"
  # width, height
  # validate :file_dimensions, :unless => "errors.any? or attachment.original_filename.blank?"
  
  # private
  # #尺寸不能太大
  # def file_dimensions
  #   dimensions = Paperclip::Geometry.from_file(attachment.to_file(:original))
  #   if dimensions.width >1500 or dimensions.height > 1500
  #     errors.add(:attachment,"图片长宽都不能超过1500像素")
  #   end
  # end
  
end
