# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

# 等采集了3000篇文章后还是有用的
# count  = 0
# (1..794).each do |id|
#   a = Article.find_by_id(id)
#   if a
#      a.attachment_file_name = "#{count}.jpg"
#      a.attachment_content_type = "image/jpeg"
#      a.attachment_file_size = 62917
#      a.attachment_updated_at = "2012-06-27 02:26:32"
#      if a.content.length > 301
#        a.content = a.content[0..300] + a.content[301..-1].sub(">","><a href='http://www.puake.com'><img alt='pua课程网' snrc='/system/articles/attachments/2012-06/#{count}.jpg' /></a><p></p>") 
#      else
#        a.content = a.content + "<a href='http://www.puake.com'><img alt='pua课程网' src='/system/articles/attachments/2012-06/#{count}.jpg' /></a><p></p>"
#      end
#      a.save(:validate => false)  
#      count = count + 1
#   end
# end


# Article.all.each do |a|
#   a.description = a.description.gsub(/<img.*paoniuxue.*?>/,"")  
#   a.save(:validate => false)
# end


  # Category.where(:typeable => "Saying").all.each do |ca|
  #   ca.update_attribute(:typeable, "Usage")
  # end

# Usage.all.each do |u|
#   match = u.content.match(/<span.*usage_pinglun\'>(.*)<\/span>/)
#   text = match[1]
#   u.content = u.content.gsub(/<span.*<\/span>/,"<span class='usage_pinglun'>@#{text}</span>")
#   u.save(:validate => false)
# end
# Person.find(1).update_column(:email,"paoniuxue@163.com")
# Person.find(3).update_column(:email,"399906796@qq.com")

# Classroom.find(1).update_column(:name,"泡妞学官方聊天室")
# Category.find(35).update_column(:name, "7.(高级)前戏")
# Category.find(36).update_column(:name, "8.(高级)反荡妇防卫")
# Category.find(37).update_column(:name, "9.(高级)Sex")


# Usage.all.each do |u|
#   u.content = u.content.gsub(/@@/,"@")
#   u.save(:validate => false)
# end
# 
# Comment.all.each do |c|
#   if c.commable_type == "Usage"
#     c.update_column(:commable_type, "Note")
#   end
# end
# 
# Category.all.each do |c|
#   if c.typeable == "Usage"
#     c.update_column(:typeable, "Note")
#   end
# end

# Event.find(128).update_column(:deposite,400)


# index = 0
# names.each do |name|
#   qq = rand(100000000..1000000000)
#   qq_email = qq.to_s + "@qq.com"
#   person = Person.create(:email => qq_email, :password => "827108yin",:nick_name => name, :city => cities[index], :role => "学员")
#   index = index + 1
# end


# 448..465
# topic = Topic.create(:title => "表白以后女孩答应又反悔",:content => "",:person_id => 463, :group_id => 1, :created_at => Time.now.ago(60*60*4).to_s(:db))
# 
# Comment.create(:content => "", :person_id => 4,:commable_id => topic.id, :commable_type => "Topic", :created_at => Time.now.to_s(:db))



# day = 16 
# person_id = 470
# Category.find(14).articles.each do |article|
#   title = article.title.gsub(/\[问题解答\]|【问题解答】/,"")
#   content = article.content.gsub(/寒江雪大师|寒江雪哥哥|寒达达|寒大侠|寒兄|寒大哥|寒哥|寒江雪|老寒|寒老师|寒前辈/,"老师")
#   content = content.gsub(/网友来信:|网友提问:/,"")
#   match = content.match(/老师答复:.*|老师解答:.*|老师回复:.*/m)
#   comment_content = match[0].gsub(/<\/h4>/,"")
#   
#   content = content.gsub(/老师答复.*|老师解答.*|老师回复.*/m,"")
#   content = content.gsub(/<img.*">/,"")
#   topic = Topic.create(:title => title,:content => content,:person_id => person_id, :group_id => 1, :created_at => Time.now.ago(60*60*24*day).to_s(:db))
# 
#   Comment.create(:content => comment_content, :person_id => 4,:commable_id => topic.id, :commable_type => "Topic", :created_at => Time.now.ago(60*60*24*day-60*60*4).to_s(:db))
#   day = day + 1
#   person_id = person_id + 1
# end
# 剩下没使用的person: 615--619
# Person.all.each do |person|
#   person.update_column(:dead,"no")
# end

# Discussion.all.each do |discussion|
#   discussion.update_column(:content_html,discussion.content)
# end

# Person.all.each do |p|
#   if p.dead == nil 
#     p.update_column(:dead, "no")
#   end
# end

#Resource.all.each do |r|
#  if (834..854).include?(r.id)
#    puts "includ"
#    Resource.delete(r)
#  end
#end
# 
#/Users/tank/sites/mysites/v8/db/mp3.html
#/opt/nginx/html/paoniuxue/db/mp3.html
 # File.open("/opt/nginx/html/paoniuxue/db/mp3.html") do |file|  
 # file.each_line do |line|
 #    if line.chomp == ""
 #      sleep(2)
 #      puts "kong"
 #    else 
 #      a = line.split("mp3")
 #      Resource.create(:title => a[0]+"mp3",:download_link => a[1].chomp,:category_id => 21, :person_id => 6)
 #      sleep(1)
 #    end
 #   end
 #   file.close()
 # end
 # 

# Topic.all.each do |t|
#   if t.comments.size > 0
#     t.update_column(:last_replied_by, t.comments.last.person.id)
#     t.update_column(:last_replied_at, t.comments.last.created_at)
#   end
# end

# Event.all.each do |event|
#   event.update_column(:online,"no")
# end

# Event.all.each do |event|
#   event.update_column(:start_datetime,event.start_datetime+1.hours)
#   event.update_column(:end_datetime,event.end_datetime+10.hours)  
# end


 
# time1 = Time.mktime(2012,9,15,20,0,0)
# time2 = Time.mktime(2012,9,15,23,0,0)
# 
# 16.times do |t|
#   event = Event.create(:name => "周末在线讨论答疑",:start_at => time1, :end_at => time2, :holiday => "周末", :city => "pua课程网", :top_number => 100, :now_number => 35, :teacher => "Mike",  :cost => 0, :discount => 0, :discount_requirement => "任何加入群的学员请用你们的账号登录,针对群内学员都是免费的.这样的活动一般每周末都有", :deposite => 0, :person_id => 4, :category => "讨论答疑", :online => "yes", :created_at => Time.now, :updated_at => Time.now)
#   time1 = time1 + 7.days
#   time2 = time2 + 7.days
# end


# a = "第50题:"+"答错了!再接再厉!你需要继续学习!"
# match = a.match(/\d+/)
# puts match.to_s.to_i




# 第一步:创建picture数据库
# Article.all.each do |article| 
#   article.picture_file_name = article.attachment_file_name
#   article.picture_content_type = article.attachment_content_type
#   article.picture_file_size = article.attachment_file_size
#   article.picture_updated_at = article.attachment_updated_at
#   article.save
# end

# 第二步:拷贝图片, 注意修改服务器的绝对路径

# Article.all.each do |article| 
#   date = article.attachment_updated_at.to_date.to_s[0,7]
#   name = article.attachment_file_name
#   hash_original = article.picture.url.match(/original\/(.*jpg)/)[1]
#   hash_medium = article.picture.url(:medium).match(/medium\/(.*jpg)/)[1]
#   
#   # system "cp /Users/tank/Sites/mysites/v8/public/system/articles/attachments/#{date}/#{name} /Users/tank/Sites/mysites/v8/public/system/articles/pictures/#{date}/original/#{hash_original}"
#   #   
#   #   system "cp /Users/tank/Sites/mysites/v8/public/system/articles/attachments/#{date}/#{name} /Users/tank/Sites/mysites/v8/public/system/articles/pictures/#{date}/medium/#{hash_medium}"
#   
#     system "cp /opt/nginx/html/paoniuxue/public/system/articles/attachments/#{date}/#{name} /opt/nginx/html/paoniuxue/public/system/articles/pictures/#{date}/original/#{hash_original}"
#        
#     system "cp /opt/nginx/html/paoniuxue/public/system/articles/attachments/#{date}/#{name} /opt/nginx/html/paoniuxue/public/system/articles/pictures/#{date}/medium/#{hash_medium}"
# end




# 先去掉images
# Article.all.each do |a|
#   a.content = a.content.sub(/<a\shref=\'http:\/\/www\.paoniuxue\.com\'><img.*attachments\/2012-\d\d\/.*\.jpg\'\s\/><\/a><p><\/p>/,"")  
#   a.save(:validate => false)
# end
# # 
# # 
# Article.all.each do |a|
#   a.content =   a.content.sub(/<img\ssrc=\'\/system.*attachments\/2012-\d\d\/([\d|_]*)\.jpg\'\salt=\'.*\'\s\/><p><\/p>/,"")
#   a.save(:validate => false)
# end

# Article.all.each do |a|
#   a.content =   a.content.sub(/<img\ssrc=\'\/system.*attachments\/2012-\d\d\/[\d|_|\-|a-z]*\.jpg\'\s\/><p><\/p>/,"")
#   a.save(:validate => false)
# end


# 增加description
# Article.all.each do |a|
#   a.description =   a.content[0,1500]
#   a.save(:validate => false)
# end


# Event.all.each do |event| 
#   if event.online == "yes"
#     Event.delete(event)
#   end
# end

# Comment.all.each do |c|
#   
#   if c.content.include?("paoniuxue")
#     c.content = c.content.gsub(/paoniuxue/,"puake")
#   end
#   if c.content.include?("category/")
#     c.content = c.content.gsub(/category\//,"")
#   end
#   if c.content.include?("/guangpan")
#     c.content = c.content.gsub(/\/guangpan/,"")
#   end
#   if c.content.include?("/guanlis")
#     c.content = c.content.gsub(/\/guanlis/,"/notes")
#   end
#   if c.content.include?("classes/1/")
#       c.content = c.content.gsub(/class\/1\//,"")
#   end
#   if c.content.include?("puake.taobao")
#       c.content = c.content.gsub(/puake\.taobao/,"paoxueke.taobao")
#   end
#   c.save(:validate => false)
# end
#       
# Article.all.each do |c|
#   
#   if c.content.include?("<span>")
#      c.content = c.content.gsub(/<span>/,"")   
#      c.save(:validate => false)
#   end
# end
# 
# 
# Article.all.each do |c|
#   
#   if c.description.include?("<span>")
#      c.description = c.description.gsub(/<span>/,"")   
#      c.save(:validate => false)
#   end
# end
#     
# 
# Article.all.each do |c|
#   
#   if c.content.include?("<span/>")
#      c.content = c.content.gsub(/<span\/>/,"")   
#      c.save(:validate => false)
#   end
# end
# 
# 
# Article.all.each do |c|
#   
#   if c.description.include?("<span/>")
#      c.description = c.description.gsub(/<span\/>/,"")   
#      c.save(:validate => false)
#   end
# end 
                   

# Article.find([452,823]).each do |c|
#   c.destroy
# end               
# Category.find(2).destroy
# 
# Article.find([423,383]).each do |c|
#   c.destroy
# end  
# 
# Article.find([445]).each do |c|
#   c.destroy
# end   
                   
# Article.all.each do |c|      
#     c.description = c.description.gsub(/<p>/,"!!!p") 
#     c.description = c.description.gsub(/<\/p>/,"p!!!")   
#     c.content = c.content.gsub(/<p>/,"!!!p")
#     c.content = c.content.gsub(/<\/p>/,"p!!!")   
#     c.save(:validate => false)  
# end
#       
# Article.all.each do |c|      
#     c.description = c.description.gsub(/<\/?.*?>/,"")  
#     c.content = c.content.gsub(/<\/?.*?>/,"") 
#     c.save(:validate => false)  
# end     
#       

#Article.all.each do |c|      
#    c.description = c.description.gsub(/!!!p/,"<p>") 
#    c.description = c.description.gsub(/p!!!/,"</p>")   
#    c.content = c.content.gsub(/!!!p/,"<p>")
#    c.content = c.content.gsub(/p!!!/,"</p>")   
#    c.save(:validate => false)  
#end 
#      

# 
# 20.times do |x| 
#   person = Person.new()
#   person.save(:validate => false)
#   topic = Topic.new()
#   topic.save(:validate => false)
# end   
# # 
# 50.times do |x|
#   comment = Comment.new
#   comment.save(:validate => false)
# end  
# 
# 20.times do |x|
#   asset = Asset.new
#   asset.save(:validate => false)
# end   
       
# Person.all.each do |p|
#   if p.id!=4 and !p.email.include?("fake@qq.com")
#     p.destroy
#   end
# end  

# 
# Person.last(20).each do |p|
#   p.destroy
# end        


       
# require 'open-uri'
#                   
# cities=%w(上海 北京 深圳 广州 成都 武汉 重庆 杭州 南京 东莞 天津 长沙 合肥 厦门 温州 郑州 广东 苏州 南昌 沈阳 青岛 浙江 哈尔滨 西安 宁波 南宁 大连 济南 山东 广西 佛山 福州 河南 昆明 惠州 江西 台州 珠海 太原 湖北 常州 衡阳 石家庄 安徽 洛阳 金华 烟台 徐州 无锡 贵阳 海口 四川 唐山 三亚 柳州 邯郸 临沂 汕头 兰州 泰安 湛江 内蒙古 湖南 长春 乌鲁木齐 威海 嘉兴 江门 茂名 镇江 盐城 福建 绍兴 信阳 永州 香港 大庆 秦皇岛 襄阳 河北 鄂州 咸阳 平顶山 漳州 宜昌 肇庆 湘潭 张家口 锦州 商丘 承德 桂林 西宁 清远 沧州 焦作 中山 保定 南阳 大理 潍坊 海南 江苏 泰州 淄博 十堰 眉山 宁德 黄石 菏泽 安顺 荆州 龙岩 上饶 丽水 辽宁 邵阳 常熟 阳泉 邢台 铁岭 连云港 吉安 顺德 株洲 北海 宿迁 鄂尔多斯 驻马店 淮安 东营 安阳 襄樊 莱芜 梧州 玉林 郴州 芜湖 揭阳 日照 九江 开封 泉州 黄州 江阴 郫县 辽阳 绥化 柳城县 赣州 青海 怀化 白城 伊春 徐州 来宾 地球 黄山 溧阳 保山 库尔勒 鹤岗 枣庄 德州 石河子 云浮 丽江 淮南 银川 鹰潭 诸暨 南平 荆门 普宁 抚顺 营口 长治 齐齐哈尔 克拉玛依 宝鸡 安庆 盘锦 曲靖 荷泽 德阳 衡水 濮阳 延安 三明 南充 达州 孝感 三门峡 玉溪 马鞍山 通辽 莆田 宜宾 榆林 宜春 赤峰 绵阳 临汾 鞍山 济宁 南通 漯河 开平 运城 河池 河源 射洪 扬州 包头 新乡 周口 许昌 廊坊 常德 岳阳 枣庄 湖州 刑台 滨州 聊城 呼和浩特 昆山 渭南 海宁 蚌埠 六盘水 兴义 东莞市 晃荡 万宁 柔佛 台北 乐山 泸州 内江 丰镇 福鼎 北安 张家界 晋中 松原 海兴 天水 淮北 梅州 嘉峪关 舟山 临海)   
# pages = [] 
# Dir.glob(File.expand_path("~/Desktop/pages/*")) { |f|
#    pages << f  
# }   
#       
# remove = []
# pages.each do |page|
# #   # image_urls = []       
#      file = File.open(page, "rb") 
#      content = file.read
#      file.close
#      content = content.force_encoding 'utf-8'                         
#     #            
    # #                           
    # begin          
                       # topic_title_match = content.match(/class=\"ts\">\s*<a.*?>(.*?)<\/a>\s*<a.*?>(.*?)<\/a>/m)  
                       
            # topic_title_match = content.match(/class=\"ts\">\s*<a.*?>(.*?)<\/a>/m)
            # topic_title_type = topic_title_match[1]
                    # topic_title = topic_title_match[1]  
                    
                  # topic_title =  topic_title_type + topic_title 
         #      if ["[开场白]","[冷读]","[话术]"].include?(topic_title_type) 
         #                  # puts  topic_title_type+"/"+topic_title      
                            # puts topic_title
         #                else
         #                  remove << page
         #                  end        
        #                       
         #  rescue
         #       remove << page
         #       next
         # end
         # if topic_title_match.nil?
         #   remove << page
         # else
         #   if topic_title_match[1].nil?
         #     remove << page
         #   end
         # end                                   
                        
     # if content.include?('<div class="rwdn">')  
       # topic_body =  content.scan(/<div\sclass=\"rwdn\">.*?<div\sid="comment_\d*\" class=\"cm\">/m) 
       #  topic_comments = content.scan(/<div\sclass=\"pcbs\">.*?<div\sid="comment_\d*\" class=\"cm\">/m)
       #  if topic_comments.size > 1
       #    topic_comments = topic_comments[1,topic_comments.size-1]               
       #  else 
       #    topic_comments = []
       #  end
       #  topic_content_array = topic_body + topic_comments   
           #     
           # topic_content_array = content.scan(/<div\sclass=\"t_fsz\">.*?<div\sid="comment_\d*\" class=\"cm\">/m)                                                                           
           #                      topic_content_array.map do |c|
           #                             c.gsub!(/<div\sid="comment_\d*\" class=\"cm\">/,"")
           #                           end    
           #                              
           #                           topic_author_array = content.scan(/<div class="authi"><a.*?>(.*?)<\/a>/m).flatten + content.scan(/<div class="pi">\s*(\p{Word}+?)\s<em>该用户已被删除<\/em>\s*<\/div>/m).flatten   
           #                           
           #                           topic_created_at_array = content.scan(/<em id="authorposton\d*">发表于\s(.*?)<\/em>/m).flatten        
                                                         
                                                                                                      
      # puts topic_content_array.to_s
      # topic_content_array.each do |c| 
      #           puts c
      #           puts "================================>"
      #           
      #  end    
         # puts topic_title
#          test_array=[]
#        test_array << topic_content_array.size    
#                 test_array << topic_author_array.size
#                 test_array << topic_created_at_array.size
#                 puts test_array.to_s                 
#        unless (test_array[0] == test_array[1] and test_array[1]  == test_array[2])
#          puts page
#          remove <<  page
#        end                                                                       
# #                                        #   # 去掉没内容的或者只有一个评论的
#          if test_array[0] == 0 or test_array[0] ==1 
#               puts page
#              remove <<  page
#           end                                                                                             
         # #                                              
    # if page == "/Users/tank/Desktop/pages/thread-85738-1-1.html" 
    #        topic_content_array.each do |x| 
    #          puts x.to_s
    #          puts "============================================="
    #        end
    #     end                                                                                
    #             
    # if topic_title.include?("一个老乡，评评看")
    #       puts page
    # end    
    #       
    # 
    # topic_category_id = 
    # case topic_title_type
    #   when "[实战经历]" then 43
    #     when "[理论经验]" then 44 
    #       when "[搭讪天下]" then  39 
    #         when "[心态提升]" then 45 
    #           when "[话术惯例]" then 50 
    #             when "[长期关系]" then 46 
    #               else 
    #                 100
    #                 end  
    # person = Person.where("nick_name=?",topic_author_array[0])[0]   
    #                 
    #  if person  == nil   
    #    person = Person.new(:email => rand(7000000..10000000000).to_s+"fake"+"@qq.com", :nick_name  => topic_author_array[0],  :city => cities[rand(253)], :password => "fakepassword",:password_confirmation => "fakepassword", :score => 2)  
    #    #对于非图片栏目的人,可以为非学员    
    #    person.role = "学员"
    #    if person.save
    #      puts "person"
    #  
    #      topic = Topic.new(:title => topic_title, :content => topic_content_array[0], :person_id => person.id, :created_at => Time.parse(topic_created_at_array[0]),:updated_at => Time.parse(topic_created_at_array[0]), :group_id => 1, :category_id => 51, :last_replied_at => Time.parse(topic_created_at_array[0]),:url => page )
    #      if topic.save
    #        puts "topic"
    #        topic_author_array[1,topic_author_array.size-1].each_with_index do |author_name,index |
    #          # 注意时间和内容与author不同步了. 
    #          index = index+1
    #          comment_person = Person.where("nick_name=?",author_name)[0]
    #          if comment_person.nil?
    #            comment_person = Person.new(:email => rand(7000000..10000000000).to_s+"fake"+"@qq.com", :nick_name  => author_name,  :city => cities[rand(253)], :password => "fakepassword",:password_confirmation => "fakepassword", :score => 2)      
    #            comment_person.role = ["学员","非学员"][rand(0..1)]
    #            if comment_person.save
    #              puts "comment_person"
    #              comment = Comment.new(:content => topic_content_array[index], :person_id => comment_person.id, :commable_id => topic.id,:commable_type => "Topic",:created_at => Time.parse(topic_created_at_array[index]), :updated_at => Time.parse(topic_created_at_array[index]) )    
    #              if comment.save 
    #                puts 'comment'
    #                topic.update_column(:last_replied_at, Time.parse(topic_created_at_array[index])) 
    #                topic.update_column(:last_replied_by,comment_person.id)
    #              end
    #            end
    #          else
    #            comment = Comment.new(:content => topic_content_array[index], :person_id => comment_person.id, :commable_id => topic.id,:commable_type => "Topic",:created_at => Time.parse(topic_created_at_array[index]), :updated_at => Time.parse(topic_created_at_array[index]) )    
    #            if comment.save
    #              puts "comment"
    #              topic.update_column(:last_replied_at, Time.parse(topic_created_at_array[index])) 
    #              topic.update_column(:last_replied_by,comment_person.id)
    #            end
    #          end
    #        end
    #        
    #      else 
    #        puts topic.errors.full_messages.to_s
    #      end
    #    end 
    #  
    #  else       
    #    topic = Topic.new(:title => topic_title, :content => topic_content_array[0], :person_id => person.id, :created_at => Time.parse(topic_created_at_array[0]),:updated_at => Time.parse(topic_created_at_array[0]), :group_id => 1, :category_id => 51, :last_replied_at => Time.parse(topic_created_at_array[0 ]),:url => page )
    #    if topic.save
    #      puts "topic"
    #      topic_author_array[1,topic_author_array.size-1].each_with_index do |author_name,index | 
    #        # 注意时间和内容与author不同步了. 
    #        index = index+1
    #        comment_person = Person.where("nick_name=?",author_name)[0]
    #        if comment_person.nil?
    #          comment_person = Person.new(:email => rand(7000000..10000000000).to_s+"fake"+"@qq.com", :nick_name  => author_name,  :city => cities[rand(253)], :password => "fakepassword",:password_confirmation => "fakepassword", :score => 2)      
    #          comment_person.role = ["学员","非学员"][rand(0..1)]
    #          if comment_person.save
    #            puts "comment_person"
    #            comment = Comment.new(:content => topic_content_array[index], :person_id => comment_person.id, :commable_id => topic.id,:commable_type => "Topic",:created_at => Time.parse(topic_created_at_array[index]), :updated_at => Time.parse(topic_created_at_array[index]) )    
    #            if comment.save
    #              puts 'comment'
    #              topic.update_column(:last_replied_at, Time.parse(topic_created_at_array[index])) 
    #              topic.update_column(:last_replied_by,comment_person.id)
    #            end
    #          end
    #        else
    #          comment = Comment.new(:content => topic_content_array[index], :person_id => comment_person.id, :commable_id => topic.id,:commable_type => "Topic",:created_at => Time.parse(topic_created_at_array[index]), :updated_at => Time.parse(topic_created_at_array[index]) )    
    #          if comment.save
    #            topic.update_column(:last_replied_at, Time.parse(topic_created_at_array[index])) 
    #            topic.update_column(:last_replied_by,comment_person.id)
    #          end
    #        end
    #      end
    #    else 
    #      puts topic.errors.full_messages.to_s
    #    end 
    #  end                                 
# #                
# end                 

# puts remove.uniq.to_s   
# Topic.where(:category_id=>44).last(72).each do |topic|
#   topic.update_column(:title, "[精华]"+topic.title)
# end           
# 修改一下topic.category_id 
# Topic.all.each do |topic|
#   topic.update_column(:category_id,44)
# end  


# 下载图片
# Topic.all.each do |topic|
#   image_urls = []
#   match_array = topic.content.scan(/\s+file="(http:\/\/.*?[jpg|jpeg|png|gif|bmp])"/i).flatten
#   match_array.each do |match|
#       unless match.include?("photo.store.qq.com") 
#         if match.include?("paoxue")
#           if match.include?("paoxue.com/data")
#             image_urls <<  match 
#           end 
#         else
#           image_urls << match
#         end
#       end 
#   end
#   if image_urls.size > 0  
#     system("cd ~/Dropbox/project/v8/download_images;mkdir #{topic.id}; ") 
#       image_urls = image_urls.map{|url| url.gsub("&","\&")}
#     image_urls.each do |url| 
#          system("cd ~/Dropbox/project/v8/download_images/#{topic.id};wget -t2 -T 15 #{url}")
#     end 
#   end 
#   
# end      

    


# 删除那些含有不合格的图片的topic, 
# 有些图片能在电脑显示,但是后缀有问题.要查看一下. 打开finder检查删掉一些图片
 
# ids = []  
# files = `cd ~/Dropbox/project/v8/download_images/;find * -type f`
# files = files.split(/\s/)
# files.each do |f| 
#  type = `cd ~/Dropbox/project/v8/download_images/;file #{f}`
#  if type.include?("HTML") or type.include?("troff or preprocessor")
#    ids << f.split("/")[0]
#  end  
# end  
# # 
# puts ids.uniq  
# ids.uniq.each do |id| 
#   system("cd ~/Dropbox/project/v8/download_images/; rm -r #{id}")
#   # Topic.find(id.to_i).destroy
# end     
#     

#去掉空文件夹
# ids = []  
# dirs = `cd ~/Dropbox/project/v8/download_images/;find * -type d`
# dirs = dirs.split(/\s/)
# dirs.each do |dir| 
#  files = `ls ~/Dropbox/project/v8/download_images/#{dir} | wc -l`
#   if files.to_i == 0
#     system("cd ~/Dropbox/project/v8/download_images/; rm -r #{dir}")
#      # Topic.find(dir.to_i).destroy 
#   end
# end       




# 对于有合格图片的id去创建asset
# Dir.chdir("/Users/tank/Dropbox/project/v8/download_images")
# Dir.glob("*") do |dir| 
#   Dir.chdir(dir)
#   Dir.glob("*") do |file|
#     asset = Asset.new(:topic_id => dir.to_i,:image_file_name => file, :image_content_type => "image/"+File.extname(file).sub(".",""),:image_file_size => File.size(file),:image_updated_at => Time.parse("2013-05-13 06:56:12"), :updated_at => Time.parse("2013-05-13 06:56:14"), :created_at => Time.parse("2013-05-13 06:56:14")) 
#     if asset.save
#       `cp #{file} /Users/tank/Dropbox/project/v8/public/system/assets/images/2013-05/original`
#       `cp #{file} /Users/tank/Dropbox/project/v8/public/system/assets/images/2013-05/medium`
#       `cp #{file} /Users/tank/Dropbox/project/v8/public/system/assets/images/2013-05/thumb`
#       
#       int_time = Time.parse("2013-05-13 06:56:12").to_i
#       extension = File.extname(file)
#       original_hash =  OpenSSL::HMAC.hexdigest(OpenSSL::Digest.const_get("SHA1").new, "secretisnosecret", "#{asset.id}/original/#{int_time}")
#       medium_hash =  OpenSSL::HMAC.hexdigest(OpenSSL::Digest.const_get("SHA1").new, "secretisnosecret", "#{asset.id}/medium/#{int_time}")
#       thumb_hash = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.const_get("SHA1").new, "secretisnosecret", "#{asset.id}/thumb/#{int_time}")
#       
#       file_original_name = original_hash + extension
#       file_medium_name = medium_hash + extension
#       file_thumb_name =  thumb_hash + extension
#        File.rename("/Users/tank/Dropbox/project/v8/public/system/assets/images/2013-05/original/"+file,"/Users/tank/Dropbox/project/v8/public/system/assets/images/2013-05/original/"+file_original_name) 
#        File.rename("/Users/tank/Dropbox/project/v8/public/system/assets/images/2013-05/medium/"+file,"/Users/tank/Dropbox/project/v8/public/system/assets/images/2013-05/medium/"+file_medium_name)
#        File.rename("/Users/tank/Dropbox/project/v8/public/system/assets/images/2013-05/thumb/"+file,"/Users/tank/Dropbox/project/v8/public/system/assets/images/2013-05/thumb/"+file_thumb_name)
#                                                         
#     else 
#       puts asset.errors.full_messages
#     end
#     
#   end
#   Dir.chdir("..")
#   
# end          

 


# 用convert更改图片大小
# Dir.chdir("/Users/tank/Dropbox/project/v8/public/system/assets/images/2013-05/medium")  
# Dir.glob("*") do |file|
#   `convert #{file} -auto-orient -resize "560x746>" #{file}`
# end    
#      
#        
# Dir.chdir("/Users/tank/Dropbox/project/v8/public/system/assets/images/2013-05/thumb")  
# Dir.glob("*") do |file|
#   `convert #{file} -auto-orient -resize "50x50>" #{file}`
# end;    
#         
# 用shell批量截取图片最下面: 
# for i in *;do convert -gravity South -chop 0x20 $i $i;done

# 用shell 加水印: 
# for i in *;do mogrify -pointsize 16 -fill white -weight bolder -gravity southwest -annotate +5+5 "www.puake.com" $i; done

 

# 去掉文件后缀不正确的assets

#去topic广告和无用的html

# Topic.all.each do |topic|  
  # 去掉topic上面的html实体符号
  # new_topic = topic.title.gsub("&lt;","<").gsub("&gt;",">").gsub("&amp;","&").gsub("&quot;",'"')
  #     topic.update_column(:title, new_topic)  
    # puts topic.title  
  
  # content里面也要换
  
  # new_content = topic.content.gsub("&lt;","<").gsub("&gt;",">").gsub("&amp;","&").gsub("&quot;",'"')
  #   topic.update_column(:content, new_content)  
  
  
  
  # 去掉content里面的广告
  # new_content = topic.content.gsub(/<div class="a_pr".*?<\/div>/m,"")
  #     topic.update_column(:content, new_content)  
  
  # 去掉content里面的 "本贴最后由谁编辑.."
  # new_content = topic.content.gsub(/<i class="pstatus">.*?<\/i>/m,"")
  #     topic.update_column(:content, new_content)      

  #去掉content里面的版规
  # new_content = topic.content.gsub(/本版版规.*?违反者直接封号/m,"")
  #     topic.update_column(:content, new_content)     
  
  #去掉里面的图片, 模式1 
  # new_content = topic.content.gsub(/<div class="pattl">.*/m,"")
  #   topic.update_column(:content, new_content)      
  #                                         
            
  #去掉里免的图片, 模式2 , 记住模式2最后要加上</table>标记, 因为</table>在后面被去掉了 
  # new_content = topic.content.gsub(/<ignore_js_op>.*/m,"")
  # new_content = new_content + "</table>"
  # topic.update_column(:content, new_content)
  
   # 另外一种模式2: 插入图片,然后删除相应的asset
   
     # ignores_array = topic.content.scan(/<ignore_js_op>\s*<img.*?\sfile="http:\/\/.*?[jpg|png|gif|bmp]".*?<\/ignore_js_op>/im)              
     # ignores_array.each_with_index do  |ignore,index|
     #   puts index
     #   topic.content = topic.content.sub(ignore,topic.find_match_asset(ignore))
     # end              
     # 
     # topic.update_column(:content,topic.content)   
     
    
   
    # 检查是否还有ignore_js_op,一般是需要泡币来下载附件,删除掉这种文章 
    # if topic.content.include?("ignore_js_op")
    #   puts topic.id 
    #   topic.destroy
    # end      


  # 去掉最上面的<div class="t_fsz">,去掉table , 如果table后面还有div一起去掉.    
  # new_content = topic.content.gsub(/<div class="t_fsz">.*?postmessage_\d*">/m,"")
  #  new_content = new_content.gsub(/(<\/td><\/tr>)?<\/table>(\s*<\/div>)?/m,"")  
  #  topic.update_column(:content, new_content)     
                
  
  # 检查哪些content含img,这相当于模式3 
   # system("open http://localhost:3000/topics/#{topic_id}/edit") 

   # imgtag_array = topic.content.scan(/<img id=".*? \/>/im)              
   # imgtag_array.each_with_index do  |imgtag,index|
   #   puts index
   #   topic.content = topic.content.sub(imgtag,topic.find_match_asset(imgtag))
   # end              
   # 
   # topic.update_column(:content,topic.content)   
   
  #去掉剩余的paoxue里面的static img,相当于模式4  
  # new_content = topic.content.gsub(/<img id=".*? \/>/im,"")  
  #    topic.update_column(:content,new_content)  
                                                          
  
  # 从数据库而不是从rails修改已经插入的asset, 为了保留插入到文章的图片
  
  # topic.assets.each do |asset| 
  #   if topic.content.include?(asset.image.url(:medium))
  #     asset.update_column(:asset_type, "inner_image")
  #   else 
  #     asset.update_column(:asset_type,"attachment")
  #   end 
  # end             
  
   
  
  #把泡学百科里面的a里面的内容保留
    # atags= topic.content.scan(/<a href="http:\/\/baike.paoxue.com.*?>(.*?)<\/a>/m).flatten.uniq 
    #        atags.each do |atag|
    #            topic.content = topic.content.gsub(/<a href="http:\/\/baike.paoxue.com.*?>#{atag}<\/a>/m,atag)
    #        end    
    #        topic.update_column(:content,topic.content)  
  
  # 对于泡学的url,一样处理,后面把泡学改成pua.下面要修改一下,应该保留 http://paoxue.com/thread-102161-1-1.html 超链接在后面一起随广告去掉.          
  
  # atags= topic.content.scan(/<a href="http:\/\/paoxue.com.*?>(.*?)<\/a>/m).flatten.uniq 
  #     atags.each do |atag|
  #         topic.content = topic.content.gsub(/<a href="http:\/\/paoxue.com.*?>#{atag}<\/a>/m,atag)
  #     end 
  #     topic.update_column(:content,topic.content)   

   
  # 其余的a和内容一起去掉,因为里面有很多的广告  
   # new_content = topic.content.gsub(/<a.*?>.*?<\/a>/m,"")  
   #    topic.update_column(:content, new_content)   
  
  #删除所有标记, 除了<br />和<img />,对于视频, embed也要保留下来 
     # new_content = topic.content.gsub(/<p>/,"!!!p")
     # new_content = new_content.gsub(/<\/p>/,"p!!!")  
     #  new_content = new_content.gsub(/<embed/,"!!!embed") 
     #  new_content = new_content.gsub(/<\/embed>/,"embed!!!")
     # # 
     # new_content = new_content.gsub(/<br \/>/,"!!!br")
     # 
     # new_content = new_content.gsub(/<img/m,"!!!img") 
     # new_content = new_content.gsub(/<\/?.*?>/m,"")
     # new_content = new_content.gsub("!!!p","<p>")
     # new_content = new_content.gsub("p!!!","</p>")
     # new_content = new_content.gsub("!!!br","<br />")
     # new_content = new_content.gsub("!!!img","<img")  
     # new_content = new_content.gsub("!!!embed","<embed")
     # new_content = new_content.gsub("embed!!!","</embed>")    
     #      
     # # 
     # topic.update_column(:content,new_content)    
 
      
      
      # 去掉<img src="static/image/  
       # new_content = topic.content.gsub(/<img src="static.*?\s\/>/m, "")  
       #               topic.update_column(:content,new_content)  

      # 去掉<img class="s"
      # new_content = topic.content.gsub(/<img class="s".*?\s\/>/m, "")  
      #          topic.update_column(:content,new_content)    
 
     
    # 删除泡学里面的链接: http://paoxue.com/thread-102161-1-1.html            
    # new_content = topic.content.gsub(/http:\/\/paoxue.com\/thread-(\d+)-(\d+)-(\d+)\.html/m, "")  
    #     topic.update_column(:content,new_content)    
                                          
  
    # 去掉  file:///c:/                 
    # new_content = topic.content.gsub(/(\[img\])?file.*?(gif|jpg|png)(\[\/img\])?/m,"")
    #             topic.update_column(:content, new_content)   
              
 
  # 将所有发表了topic的people的role变成学员
  # if topic.person.role == "非学员"
  #       topic.person.update_column(:role,"学员")
  #   end    
  #        
  # 去掉过多的br 
  # new_content = topic.content.sub(/(\s|<br \/>|&nbsp;)*/m,"")
  #       new_content = new_content.sub(/(\s|<br \/>|&nbsp;)*\z/m,"")  #尾部
  #       topic.update_column(:content, new_content)    
  
    # 去掉过多的br ,另外一种情况
     # new_content = topic.content.gsub(/(<br \/>\s*)*\[url=\]\s?\[\/url\]/m,"")  #尾部
     #           topic.update_column(:content, new_content)    
     
     # 这个不要去掉了.因为发现段落挤在一起很难看! 去掉两个换行一起的情况 ,第三种情况,压缩了大量的空格  
      # new_content = topic.content.gsub(/(<br \/>\s*){3,}/m,"<br /><br />")  
      #         topic.update_column(:content, new_content)   
      
      # 改写一下,对于大于等于3个空格的情况,处理为2个
      # new_content = topic.content.gsub(/(&nbsp;\s?){3,}/m, "&nbsp;&nbsp;")  
      #    topic.update_column(:content,new_content)    
      #                                               
      # 去掉 br 后面的\s\n 
      # new_content = topic.content.gsub(/<br \/>\s+/m,"<br />")
      #        topic.update_column(:content,new_content) 
      
      
     # 给img后面增加换行,避免文字和img混合在一起 
     # new_content = topic.content.gsub(/\?1371077772' \/>/m,"?1368399372' /><br />")  #尾部
     #              topic.update_column(:content, new_content)    
      

  # 将泡学网改成pua课程网  将泡学改成pua课程  
   # new_content = topic.content.gsub("泡学网","pua课程网").gsub("泡学","pua").gsub("泡泡恋爱学","pua课程网") 
   #     new_title = topic.title.gsub("泡学网","pua课程网").gsub("泡学","pua")
   #   
   #     topic.title = new_title
   #     topic.content = new_content
   #     topic.save(:validate => false)     

   
                                 
   # 如果还有paoxue链接,需要手动删除  
   # if topic.id > 15000 and topic.id < 20000
   #   if topic.title.include?("paoxue") or topic.content.include?("paoxue")
   #     system("open http://localhost:3000/topics/#{topic.id}/edit")
   #   end    
   # end   
              
   
    # new_content = topic.content.gsub(/http:\/\/paoxue[^\s]*?\.html/m,"")   
    #         topic.update_column(:content, new_content)   
    
    # new_content = topic.content.gsub(/paoxue[^\s]*?\.html/m,"")   
    #               topic.update_column(:content, new_content)   
    
             #    
             # new_content = topic.content.gsub(/http:\/\/baike\.paoxue[^\s]*?\.html/m,"")   
             #     topic.update_column(:content, new_content)    
    
      # new_content = topic.content.gsub(/http:\/\/paoxue[^\s]*?fromuid=(\d)+/m,"")
      #       topic.update_column(:content,new_content)          
      
      # new_content = topic.content.gsub(/http:\/\/paoxue[^\s]*?pid(\d)+/m,"")
      #            topic.update_column(:content,new_content)  
      
      # new_content = topic.content.gsub(/http:\/\/paoxue[^\s]*?tid=(\d)+/m,"")
      #            topic.update_column(:content,new_content)   
      
      # new_content = topic.content.gsub(/paoxue\.com/m,"puake.com")
      #      topic.update_column(:content,new_content)  
      #       
 
      
      
      
    
 
    
   
   # 去掉泡币,金币,经验币 
   # new_title = topic.title.gsub("泡币","积分").gsub("金币","积分").gsub("paoxue","pua").gsub("经验币","积分")
   #         new_content = topic.content.gsub("泡币","积分").gsub("金币","积分").gsub("paoxue","pua").gsub("经验币","积分")
   #          topic.title = new_title
   #           topic.content = new_content
   #           topic.save(:validate => false)   
   
   
   #                                                   
   
   # 查看url后修正:
   # 2020, 2016, 2042, 2294
   # if topic.id ==2016
   #   topic.update_column(:category_id,nil)
   # end
   # if topic.id ==2020
   #   topic.update_column(:category_id,42)
   # end
   # if topic.id== 2294
   #   topic.update_column(:category_id,nil)
   # end     
   
   #分类
   # if topic.title.include?("微信") || topic.title.include?("陌陌")
   #       topic.update_column(:category_id, 40)
   #  end     
   #       
    
   # if topic.title.include?("搭讪") and topic.category_id!= 40
   #        topic.update_column(:category_id,39)
   #  end         
   
 
   
# end    


          
# 去comment广告和无用的html
# Comment.all.each do |comment|   
  # comment 去掉广告   

  # if comment.content.match(/<div class="a_pr".*?<\/div>/m)
  #     new_comment = comment.content.gsub(/<div class="a_pr".*?<\/div>/m, "")
  #     comment.update_column(:content, new_comment)   
  #   end 
  
  # comment 去掉里面的"本帖最后..." 
   # if comment.content.match(/<i class="pstatus">.*?<\/i>/m)
   #         new_comment = comment.content.gsub(/<i class="pstatus">.*?<\/i>/m, "")
   #         comment.update_column(:content, new_comment)        
   #     end    
  
  
  # 去掉<div class="t_fsz">和table 
  
  # new_comment = comment.content.gsub(/<div class="t_fsz">.*?postmessage_\d*">/m,"")
  #       new_comment = new_comment.gsub(/(<\/td><\/tr>)?<\/table>.*/m,"")   
  #      comment.update_column(:content, new_comment)   
  
  #去掉comment里面的<a>..</a>, 去掉里面的图片,注意:对于去掉comment里面的a,对于别的栏目在comment可能有一些专业词语,指向paoxue的百科,这个时候需要改.   
    #   
    # atags= comment.content.scan(/<a href="http:\/\/baike.paoxue.com.*?>(.*?)<\/a>/m).flatten.uniq 
    #    atags.each do |atag|
    #        comment.content = comment.content.gsub(/<a href="http:\/\/baike.paoxue.com.*?>#{atag}<\/a>/m,atag)
    #    end    
    #    comment.update_column(:content,comment.content) 
    #   
  
  # new_comment = comment.content.gsub(/<a.*?<\/a>/m,"")
        # new_comment = new_comment.gsub(/<img.*?\/>/m,"")
        # comment.update_column(:content, new_comment)    
               
     
  # 去掉过多的br
   # new_comment = new_comment.sub(/(\s|<br \/>|&nbsp;)*/m,"")
        # new_comment = new_comment.sub(/(\s|<br \/>|&nbsp;)*\z/m,"")
   #      comment.update_column(:content, new_comment)     
   
   # 去掉过多的br ,另外一种情况
    # new_comment = new_comment.gsub(/(<br \/>\s*)*\[url=\]\s?\[\/url\]/m,"")  #尾部
    #    comment.update_column(:content, new_comment) 
    
    # 去掉两个换行一起的情况 ,第三种情况,压缩了大量的空格  
     # new_comment = new_comment.gsub(/(<br \/>\s*){3,}/m,"<br /><br />")  
     #          comment.update_column(:content, new_comment)     
                                                          
     
     # 删除空格&nbsp; 因为太多了,对于超出一个空格的情况,改成一个空格
      # new_comment = new_comment.gsub(/(&nbsp;\s?){3,}/m, "&nbsp;&nbsp;")
      #         comment.update_column(:content,new_comment)       
      
        # 删除后面的\n\r
       # new_comment = new_comment.gsub(/<br \/>\s+/m,"<br />")
        #  comment.update_column(:content,new_comment)
        
    
     
     
     
   
   # 去掉引用    
   # if comment.commable_type == "Topic"
          # new_comment = new_comment.sub(/<ignore_js_op>.*/m,"")
          #              new_comment = new_comment.sub('<div class="quote">',"").sub('<font size="2"><font color="#999999">',"").sub('</font> </font>',"").sub('</div>'," ")      
   #             comment.update_column(:content, new_comment) 
   #     end         
               
   
   # 去掉没内容的comment 
   # if comment.commable_type == "Topic"
   #             if comment.content == ""
   #                comment.destroy
   #             end
   #         end  
   #                     
   
            
   # comment 泡学网改成pua课程网  将泡学改成pua课程
   
   # new_comment = new_comment.gsub("泡学网","pua课程网").gsub("泡学","pua").gsub("泡泡恋爱学","pua课程网").gsub(/<font color="#ffffff">.*?<\/font>/m,"") #去掉性用品广告
   #     comment.save(:validate => false)   
     
   #去掉里面的泡学链接:
   # if comment.content.include?("paoxue.com")  
             # new_comment = new_comment.gsub("paoxue.com","puake.com")
             # comment.update_column(:content,new_comment)
   #        end 
   #       
   # 
   # 去掉泡币,金币   
#    
#    new_comment = comment.content.gsub("泡币","积分").gsub("金币","积分").gsub("经验币","积分")
#         comment.update_column(:content,new_comment)    

    # for production  
    # match_data            = comment.content.match(/\[url\](.+)\[\/url\]/)  
    # puts comment.id
    # # if match_data
    # #       url                     = match_data[1]  #匹配里面的url
    # #       self.content            = comment.content.gsub(match_data[0], "<a href='#{url.include?("http") ? url : "http://"+url}' target='_blank'>#{url}</a>")
    # #     end    
#    
# end   



# Grade.all.each do |g|
#   if g.person.nil?
#     puts g.id
#   end
# end 

# sql命令:                     
# # drop table articles;drop table discussions;drop table events;drop table grades;drop table notes; drop table options;drop table resources; drop table subjects;drop table testings; drop table classrooms;drop table groups; 

# Asset.all.each do |asset| 
#   asset.update_column(:asset_type, "attachment")
# end
#               










         
         