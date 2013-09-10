class Asset < ActiveRecord::Base
    belongs_to :topic
    
    
    Paperclip.interpolates :image_date do |image, style|
      image.instance.image_updated_at.to_date.to_s[0,7]
    end

    #TODO:,图片如何加水印
    has_attached_file :image,        
             # 后面大于号是不要超过的意思,而且不会可以达到最小边框要求
            :styles => {:thumb => '50x50>',:medium => "560x746>"},
            :path => ":rails_root/public/system/:class/:attachment/#{Date.today.to_s[0,7]}/:style/:hash.:extension",
            :url => "/system/:class/:attachment/:image_date/:style/:hash.:extension",
            :hash_data  =>  ":id/:style/:updated_at",
            :hash_secret => "secretisnosecret"
            
     # filetype
    # TODO:必须有image验证

    # validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/gif', 'image/bmp','image/pjepg', 'image/x-png'], :message => "图片格式只能为jpg,png,gif,bmp", :unless => "image.original_filename.blank?"
    # and size
    # validates_attachment_size :image, :less_than => 500.kilobytes, :message => "图片大小不能超过500kb", :unless => "image.original_filename.blank?"
                                  
end
