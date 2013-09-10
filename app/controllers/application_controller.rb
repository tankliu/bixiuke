# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  #TODO: rescue_from ActiveRecord::RecordInvalid, :with => :show_errors
  
  protect_from_forgery
  before_filter :subdomain_filter 
  before_filter :is_login?
  
  #一个诡异的问题. 对于用路由方法截获路由错误传入到这里执行render_not_found时,会自动到login页面. 
  skip_before_filter :is_login?, :only => [:render_not_found, :render_error]
  
  
  def self.rescue_errors
      rescue_from Exception,                            :with => :render_error
      rescue_from RuntimeError,                         :with => :render_error
      rescue_from ActiveRecord::RecordNotFound,         :with => :render_not_found
      rescue_from ActionController::RoutingError,       :with => :render_not_found
      rescue_from ActionController::UnknownController,  :with => :render_not_found
      rescue_from AbstractController::ActionNotFound,   :with => :render_not_found
  end
  #开发模式和测试模式还是要直接输出错误便于调试, 只有产品模式下运行
  rescue_errors unless Rails.env.development? or Rails.env.test?
  
  def render_not_found(exception = nil)
    render :template => "error/404", :status => 404, :layout => 'application'
  end
  
  def render_error(exception = nil)
    render :template => "error/500", :status => 500, :layout => 'application'
  end
  
  def subdomain_filter  
    subdomain_name = request.subdomains.first.to_s  
    # 把所有的puake.com转到www.puake.com
    if subdomain_name.blank?  
      # 对于开发模式以及线下的产品模式不需要转,否则机器没法工作
      unless request.url.to_s.include?("local")
        redirect_to request.url.to_s.sub("//","//www.")
        return false
      end
    elsif subdomain_name != "www"  
      render_not_found
    end

    
    if request.url.include?("guangpan") || request.url.include?("guangpan.html")
      redirect_to :root
      return false
    end

   if request.url.include?("jiaocheng.")
      redirect_to request.url.to_s.sub("jiaocheng.","")
      return false
    end  
    # if request.url.include?("events")
    #    redirect_to request.url.to_s.sub("events","xianchang")
    #    return false
    #  end
    
    
    # if request.url.include?("category/")
    #   redirect_to request.url.to_s.sub("category/","")
    #   return false 
    # end
  end
  
    
	private
  # TODO, 如果一个用户已经登录了,但是你在后台把他删除了. 那么会抛出ActiveRecord::RecordNotFound, 怎么处理?
  def current_person
    @current_person ||= Person.find(session[:person_id]) if session[:person_id]    
  end
  
  def is_login?
   if session[:person_id]
     return true
   else
     redirect_to :login, :notice => "先登录才能进行操作"
   end
  end
  
  def is_admin?
    if session[:person_id]
      person = Person.find(session[:person_id])
      person.role=="admin" || (person.role == "老师" and person.id == 4)
    else
      false
    end
  end
  def is_teacher?
    Person.find(session[:person_id]).role == "老师" if session[:person_id]
  end
  def is_assistant
    Person.find(session[:person_id]).role == "助教" if session[:person_id]
  end
  def is_member?
     Person.find(session[:person_id]).role != "非学员" if session[:person_id]    
  end
  
  def only_admin_can_do
    unless is_admin?
      flash[:notice] = "你没有此权限"  
      redirect_to :back
    end
  end

  def only_member_can_do
    unless is_member?
      redirect_to :back, :notice => "非学员不能进行此操作,请联系客服QQ:399906796开通学员."
    end
  end
  
  def format_error(msg)
    return msg.gsub(/([a-z]|[A-Z]|\s|\.|_|:)*/,"")
  end
  
  
  helper_method :current_person, :is_admin?, :is_member?, :format_error
  
end
