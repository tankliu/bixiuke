# -*- encoding : utf-8 -*-
class SessionsController < ApplicationController
  
  skip_before_filter :is_login?, :only => [:new, :create]
  
  def new
    
  end
  
  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user, :notice => "登录成功。"  
    else
      flash.now.notice = "用户名或者密码不正确。"
      render "new"
    end
  end
  
  def destroy    
    session[:user_id] = nil
    flash[:notice] = "已退出"
    redirect_to action: "new"
  end
  
  
end
