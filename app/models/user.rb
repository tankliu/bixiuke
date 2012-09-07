# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  has_secure_password  #TODO: this method alse validates confirmation and can not be overrided
  # attr_protected :role, :score
  paginates_per 40
  
  #考虑下, 删除用户不一定非得删除用户的数据.可以这样:删除等于注销用户, 不允许用户登录而已．但是用户的资源仍然在， 除非用户自己一个一个删除．类似豆瓣
  has_many :courses, :dependent => :destroy
  has_many :topics, :dependent => :destroy
  has_many :notes, :dependent => :destroy
  has_many :articles, :dependent => :destroy
  has_many :resources, :dependent => :destroy
  has_many :organizations, :dependent => :destroy
  has_many :subjects, :dependent => :destroy
  has_many :discussions, :dependent => :destroy
  has_many :classrooms
  has_many :baikes 
  has_many :comments
  has_many :groups
  
  Paperclip.interpolates :photo_date do |photo, style|
    photo.instance.photo_updated_at.to_date.to_s[0,7]
  end
  
  #TODO:,图片如何加水印
  
  has_attached_file :photo,   
          :default_url => "/system/:class/:attachment/default/:style/missing.png",
          :styles => {:medium => '100x100',:thumb => "50x50"},
          # :path => ":rails_root/public/system/:class/:attachment/#{Date.today.to_s[0,7]}/:photo_file_name",
          # :url => "/system/:class/:attachment/:photo_date/:filename"
          :path => ":rails_root/public/system/:class/:attachment/#{Date.today.to_s[0,7]}/:style/:hash.:extension",
          :url => "/system/:class/:attachment/:photo_date/:style/:hash.:extension",
          :hash_secret => "secretisnosecret"
      
   # filetype
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif', 'image/bmp','image/pjepg', 'image/x-png'], :message => "图片格式只能为jpg,png,gif,bmp", :unless => "photo.original_filename.blank?"
  
  # and size
  validates_attachment_size :photo, :less_than => 500.kilobytes, :message => "图片大小不能超过500kb", :unless => "photo.original_filename.blank?"
  # width, height
  # validate :file_dimensions, :unless => "errors.any? or photo.original_filename.blank?"

  # validates_presence_of :password, :on => :create  
  validates :email, :presence => {:message => "请填写email"},
                  :format => { :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i, :message => "email格式不对,请检查", :allow_blank => true},
                  :uniqueness => {:message => "此email已经使用，请使用别的email注册。", :allow_blank => true},
                  :length => {:in => 3..100, :message => "email长度必须大于3，小于100", :allow_blank => true}       
                   
                   #TODO因为用uniq,也可以写出:unique => true ,既然每次验证都要查询数据库, 最好添加index给name
                   
  validates :password, :presence => {:message  => "请填写密码", :on => :create},
                       :length => {:in => 6..16, :message => "密码长度必须大于6，小于16", :allow_blank => true},
                       :confirmation  => {:message => "两次输入密码必须相同", :allow_blank => true}
  
  validates :nick_name, :presence => {:message => "请填写昵称"},
                        :length => {:in => 1..20, :message => "昵称长度必须大于2，小于10", :allow_blank => true},
                        :exclusion => {:in => %w(admin 管理员), :message => "不能用这些昵称", :allow_blank => true}
  
  validates :city, :presence => {:message => "请选择你所在的城市名称"},
                   :length => {:in => 2..4, :message => "城市名称长度在2到4之间", :allow_blank => true}
  
  #刚创建的时候什么角色也不是，也做不了什么，必须是学员才可以提问，下载等。。权限写在application_controller, 以后复杂了考虑用cancan插件
  #更新的时候可以变成学员或者老师
  validates :role, :inclusion => {:in => %w(非学员 学员 助教 老师), :message => "角色应该是非学员,学员,助教,老师"} 


  validates :age, :numericality => {:greater_than_or_equal_to => 16, :less_than_or_equal_to => 60, :only_integer => true, :message => "必须是整数,16到60之间", :allow_blank => true}
  validates :marriage, :inclusion => {:in => %w(未婚 已婚), :message => "请正确选择婚姻状态", :allow_blank => true}

  validates :education, :inclusion => {:in => %w(没上学 小学 初中 高中 专科 本科 硕士 博士 博士后 留学), :message => "请从选项里正确选择教育程度", :allow_blank => true}
  validates :job, :length => {:in => 2..10, :message => "目前工作介绍在2到10个字之间", :allow_blank => true}
  validates :salary, :numericality => {:greater_than_or_equal_to => 1000, :less_than_or_equal_to => 10000000, :only_integer => true, :message => "月薪只能是1000到10000000的整数", :allow_blank => true}
  validates :sex, :inclusion => {:in => %w(男 女),  :message => "性别只能是男,女,也可不填写.", :allow_blank => true} 
  Roles = %w(非学员 学员 助教 老师)   #放到form里面供选择
  def collect_subjects_for_select
    self.subjects.order("order_number").collect{|subject| [subject.title,subject.id] }
  end
  
  def rank
    score = self.score
    case 
      when 0 <= score && score <=100 then "把妹新手"
      when 100 < score && score <= 2000 then "把妹学徒"
      when 2000 < score && score <= 5000 then "把妹出师"
      when 5000 < score && score <= 10000 then "把妹高手"
      when 10000 < score && score <= 30000 then "把妹大师"
      when 30000 < score && score then "把妹达人"
    end
  end
  
end
