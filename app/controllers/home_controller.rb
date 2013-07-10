# -*- encoding : utf-8 -*-
class HomeController < ApplicationController
  
  skip_before_filter :is_login?
  
  def index
    @resources = Resource.order("created_at desc").limit(17)
    @topics = Topic.order("created_at desc").limit(20)
    @notes = Note.order("created_at desc").limit(20)
    @articles = Article.order("created_at desc").limit(20)
  end
end

