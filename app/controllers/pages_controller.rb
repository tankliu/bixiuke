# -*- encoding : utf-8 -*-
class PagesController < ApplicationController

  skip_before_filter :is_login?
  
  def guangpan
    
  end
  
  def baodao
    
  end

  def zhinanzhen
    
  end


  def hezuo
  end
  
  def zhidao
    
  end
  def xianchang
    @courses = Course.order("start_at desc").page(params[:page])      
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @courses }
    end
  end
  def wangpan
    
  end
  def xingxiang
    
  end
end
