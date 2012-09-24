# -*- encoding : utf-8 -*-
class SessionsController < ApplicationController
  
  skip_before_filter :is_login?, :only => [:new, :create]
  
  def new
    
  end
  
  def create
    @person = Person.find_by_email(params[:email])
    if @person && @person.authenticate(params[:password])
      session[:person_id] = @person.id
      @classroom = Classroom.find(1)
      redirect_to @classroom, :notice => "登录成功。"  
    else
      flash.now.notice = "用户名或者密码不正确。"
      render "new"
    end
  end
  
  def destroy    
    session[:person_id] = nil
    flash[:notice] = "已退出"
    redirect_to action: "new"
  end
  
  
end
