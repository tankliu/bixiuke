xml.instruct! 
xml.rss "version" => "2.0",
"xmlns:dc" => "http://blog.sina.com.cn/sns" do 
  xml.channel do
    xml.title '最新的惯例库' 
    xml.description h("最近添加的惯例库") 
    xml.link notes_url 
    xml.generator "FEEDCREATOR_VERSION"
    xml.language "zh-cn"
    xml.pubDate CGI.rfc1123_date(@notes.first.created_at) 
    @notes.each do |note|
      xml.item do 
        xml.title truncate(note.content, :length => 50)
        xml.link note_url(note) 
        xml.description note.content 
        xml.pubDate CGI.rfc1123_date(note.created_at) 
        xml.guid note_url(note)
        xml.author note.person.nick_name
      end
    end 
  end
end