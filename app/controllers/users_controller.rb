# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  
  skip_before_filter :is_login?, :only => [:index, :show, :new, :create]
  before_filter :only_admin_can_do, :only => [:destroy]
  
  def index
    @order_way = params[:order_way] || "score"
    @users = User.where(["role = ? or role = ? or role =? or role = ?", "学员", "老师", "助教", "admin"]).order("created_at desc") if @order_way == "join_time"
    @users = User.where(["role = ? or role = ? or role =? or role = ?", "学员", "老师", "助教", "admin"]).order("score desc") if @order_way == "score"
    @users = User.where(["role = ? or role = ? or role =? or role = ?", "学员", "老师", "助教", "admin"]).order("city") if @order_way == "city"
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  
  def show
    # @subject = Subject.new
    @user = User.find(params[:id])
    @latest_discussions = @user.discussions.order("created_at desc").limit(10)
    @latest_topics = @user.topics.order("created_at desc").limit(10)
    @latest_notes = @user.notes.order("created_at desc").limit(10)
    @latest_resources = @user.resources.order("created_at desc").limit(10)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new    
    if current_user and !is_admin?
      redirect_to :root, notice: "你已经登录,不能创建账号" and return
    else
      @user = User.new
    end
        
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    if is_admin?
      @user = User.find(params[:id])
    else
      @user = current_user 
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])  
    if is_admin?
      @user.role = params[:role]
    else
      @user.role = "非学员"
    end
    @user.score = 0
    
    respond_to do |format|
      if @user.save
        unless is_admin?
          session[:user_id] = @user.id
        end
        format.html { redirect_to @user, notice: '创建成功' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    if is_admin? and @user.id != session[:user_id]
      @user.attributes= params[:user]
      @user.role =  params[:role]
    else
      
      @user = current_user
      # can not change name when update
      #因为在user里面设置role受保护,所以不可能在params[:user]里面,防止通过url更新
      @user.attributes = params[:user]
    end
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: '更新成功' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy  
    @user = User.find(params[:id])
    @user.destroy
    
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
    
  
end

