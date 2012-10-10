# -*- encoding : utf-8 -*-
class SessionsController < ApplicationController
  
  skip_before_filter :is_login?, :only => [:new, :create]
  
  def new
    
  end
  
  def create
    @person = Person.find_by_email(params[:email])
    if @person && @person.authenticate(params[:password])
      if @person.dead == "yes"
        flash.now.notice = "你暂时被注销或者限制登陆。请联系客服QQ:1341548835"
        render "new"
      else  
        session[:person_id] = @person.id
        @classroom = Classroom.find(1)
        notice =  is_member? ? "登录成功,请参与聊天,发帖" : "你不是学员,请联系QQ:1341548835开通学员."  
        redirect_to @classroom, :notice => notice
      end
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
