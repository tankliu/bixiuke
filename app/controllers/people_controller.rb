# -*- encoding : utf-8 -*-
class PeopleController < ApplicationController
  # GET /people
  # GET /people.json
  
  skip_before_filter :is_login?, :only => [:index, :show, :new, :create]
  before_filter :only_admin_can_do, :only => [:destroy]
  
  def index
    @order_way = params[:order_way] || "score"
    @people = Person.where(["role = ? or role = ? or role =?", "学员", "老师", "助教"]).order("score desc").page(params[:page]) if @order_way == "score"
    @people = Person.where(["role = ? or role = ? or role =?", "学员", "老师", "助教"]).page(params[:page]).order("created_at desc") if @order_way == "join_time"
    @people = Person.where(["role = ? or role = ? or role =?", "学员", "老师", "助教"]).order("city").page(params[:page]) if @order_way == "city"
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @people }
    end
  end

  # GET /people/1
  # GET /people/1.json
  
  def show
    # @subject = Subject.new
    @person = Person.find(params[:id])
    @latest_discussions = @person.discussions.order("created_at desc").limit(10)
    @latest_topics = @person.topics.order("created_at desc").limit(10)
    @latest_notes = @person.notes.order("created_at desc").limit(10)
    @latest_resources = @person.resources.order("created_at desc").limit(10)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @person }
    end
  end

  # GET /people/new
  # GET /people/new.json
  def new    
    if current_person and !is_admin?
      redirect_to :root, notice: "你已经登录,不能创建账号" and return
    else
      @person = Person.new
    end
        
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @person }
    end
  end

  # GET /people/1/edit
  def edit
    if is_admin?
      @person = Person.find(params[:id])
    else
      @person = current_person 
    end
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(params[:person])  
    if is_admin?
      @person.role = params[:role]
    else
      @person.role = "非学员"
    end
    @person.score = 0
    
    respond_to do |format|
      if @person.save
        unless is_admin?
          session[:person_id] = @person.id
        end
        format.html { redirect_to @person, notice: '创建成功' }
        format.json { render json: @person, status: :created, location: @person }
      else
        format.html { render action: "new" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /people/1
  # PUT /people/1.json
  def update
    @person = Person.find(params[:id])
    if is_admin? and @person.id != session[:person_id]
      @person.attributes= params[:person]
      @person.role =  params[:role]
    else
      
      @person = current_person
      # can not change name when update
      #因为在person里面设置role受保护,所以不可能在params[:person]里面,防止通过url更新
      @person.attributes = params[:person]
    end
    
    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: '更新成功' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy  
    @person = Person.find(params[:id])
    @person.destroy
    
    respond_to do |format|
      format.html { redirect_to people_url }
      format.json { head :no_content }
    end
  end
    
  
end

