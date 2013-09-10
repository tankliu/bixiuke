# -*- encoding : utf-8 -*-
class PagesController < ApplicationController

  skip_before_filter :is_login?
  
  def guangpan
  end
  
  def baodao
  end

  def zhinanzhen
  end
  
  def vip
  end

  def hezuo
  end
  
  def zhidao
  end
  
  def xingxiang
  end
  
  def xianchang
    @events = Event.order("start_at desc").page(params[:page])      
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @events }
    end
  end
  
  def wangpan
    
  end

end
