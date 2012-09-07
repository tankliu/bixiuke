# -*- encoding : utf-8 -*-
class HomeController < ApplicationController
  
  skip_before_filter :is_login?
  
  def index
    @discussions = Discussion.order("created_at desc").page(params[:page])
    @topics = Topic.order("created_at desc").page(params[:page])
    
    @notes = Note.order("created_at desc").page(params[:page])      
    @resources = Resource.order("created_at desc").page(params[:page])
    @courses = Course.order("start_date desc").page(params[:page])      
    @articles = Article.order("created_at desc").page(params[:page])
  end
end
