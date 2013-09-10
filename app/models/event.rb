# -*- encoding : utf-8 -*-
class Event < ActiveRecord::Base
  # 增加两栏栏离开课还有多少天! 显得更加紧急

  attr_accessor  :remain_days  
  belongs_to :person
  paginates_per 10
  #还剩下多少天开始培训, 如果培训了, 不显示天, 而是显示状态
  def remain_days
    to_start_days = (start_at.to_date - Date.current).to_i
    to_end_days = (end_at.to_date - Date.current).to_i 
    case 
      when 0 < to_start_days  then "剩"+to_start_days.to_s+"天"
      when 0 >= to_start_days && to_end_days >= 0 then "进行中"
      when 0 > to_end_days then "完毕"
    end
  end
  
  
  validate :compare     

  validates :name, :presence => {:message => "请填写活动名称"},
                   :length  => {:in => 1..20, :message => "活动名称字数在1到20之间", :allow_blank => true}                   
  validates :category, :presence => {:message => "请填写活动类别"},                 
                   :length  => {:in => 1..20, :message => "活动类别字数在1到20之间", :allow_blank => true}
                   
  validates :start_at, :presence => {:message => "请填写活动开始日期"}  
  validates :end_at, :presence => {:message => "请填写活动结束日期"}
  validates :holiday, :length => {:maximum => 10, :message => "假期字数长度不能超过10", :allow_blank => true}

  validates :city, :presence => {:message => "请填写城市"},
                   :length => {:in => 2..4, :message => "城市名称在2到4字之间", :allow_blank => true}
  validates :teacher, :presence => {:message => "请填写活动教练"}, 
                      :length => {:in => 1..20, :message => "讲师字数在1到20之间", :allow_blank => true}

  validates :top_number, :numericality => {:message => "人数限制必须是整数", :only_integer => true, 
                        :greater_than_or_equal_to => 1,  :less_than_or_equal_to => 10000, :allow_blank => true}

  validates :now_number, :numericality => {:message => "现在已报名人数必须是整数", :only_integer => true,
                        :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10000, :allow_blank => true}

  validates :cost, :presence  => {:message => "请填写活动花费", :if  => Proc.new {|event| !event.discount.blank? || !event.deposite.blank?}}
  validates :cost, :numericality => {:message => "活动费用在0到100000", :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 100000, :allow_blank => true}   
  validates :discount, :presence => {:message => "优惠金额在0到100000", :if  => Proc.new {|event| !event.discount_requirement.blank?}}
  validates :discount, :numericality => {:message => "优惠必须是整数", :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 100000, :allow_blank => true } 
  validates :discount_requirement, :length => {:maximum => 50, :message => "优惠条件最多写50字", :allow_blank => true}
  validates :deposite, :numericality => {:message => "定金在0到100000", :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 100000, :allow_blank => true} 
  
  private

  def compare
    if !now_number.blank? && !top_number.blank?
      errors[:now_number] << "已报名人数不能大于人数限制" if now_number > top_number 
    end
    if !discount.blank? && !cost.blank?
      errors[:discount] << "优惠不能超过活动花费" if discount > cost
    end
    if !deposite.blank? && !cost.blank?
      errors[:deposite] << "定金不能超过活动花费" if deposite > cost 
    end
    if !start_at.blank? && !end_at.blank?
      errors[:end_at] << "活动结束日期必须在活动开始日期后" if (start_at - end_at).to_i > 0
    end
  end  

end
