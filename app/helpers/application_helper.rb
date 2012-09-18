# -*- encoding : utf-8 -*-
module ApplicationHelper
  

  def collect_article_categories_for_select
      Category.where(:typeable => "Article").order("order_number").collect{|category| [category.name, category.id]}     
  end
  
  def collect_resource_categories_for_select
      Category.where(:typeable => "Resource").order("order_number").collect{|category| [category.name, category.id]}     
  end
  
  def collect_note_categories_for_select
      Category.where(:typeable => "Note").order("order_number").collect{|category| [category.name, category.id]}     
  end

  
  def can_delete?(obj)
    obj.person.id == session[:person_id] or is_admin? 
  end
  
  def commend_star(score)
    case score
      when 1 then "★" 
      when 2 then "★★" 
      when 3 then "★★★"
      when 4 then "★★★★"
      when 5 then "★★★★★"
    end
  end
  Man_Shape = %w(骨感 中等 有型 肥胖)
  Woman_Shape = %w(骨感 中等 丰满 肥胖)
  Marriage = %w(未婚 已婚)
  Education = %w(没上学 小学 初中 高中 专科 本科 硕士 博士 博士后 留学)
  Sex = %w(男 女)   
  
  def broadcast(channel, &block)
      message = {:channel => channel, :data => capture(&block)}
      uri = URI.parse("http://localhost:9292/faye")
      Net::HTTP.post_form(uri, :message => message.to_json)
  end
end
