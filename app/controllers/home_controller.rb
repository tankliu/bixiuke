# -*- encoding : utf-8 -*-
class HomeController < ApplicationController
  
  skip_before_filter :is_login?
  
  def index
    @people = Person.order("score desc").limit(18)
    @discussions = Discussion.order("created_at desc").limit(20)
    @resources = Resource.order("created_at desc").limit(17)
    
    @courses = Course.order("start_at desc").limit(18)      
    @topics = Topic.order("created_at desc").limit(50)
    @notes = Note.order("created_at desc").limit(50)
    @apps = App.order("created_at desc").limit(50)
    @articles = Article.order("created_at desc").limit(50)
  end
end
