# -*- encoding : utf-8 -*-
class SessionsController < ApplicationController
  
  skip_before_filter :is_login?, :only => [:new, :create]
  
  def new
    
  end
  
  def create
    @person = Person.find_by_email(params[:email])
    if @person && @person.authenticate(params[:password])
      if @person.dead == "yes"
        flash.now.notice = "你的账户存在安全问题,暂时被注销或者限制登陆。请联系客服QQ:910265340"
        render "new"
      else  
        session[:person_id] = @person.id
        @group = Group.find(1)
        notice =  is_member? ? "登录成功,请发帖" : "你不是学员,不能发帖和聊天室聊天,请联系QQ:910265340开通学员."  
        redirect_to @group, :notice => notice
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
