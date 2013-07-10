# -*- encoding : utf-8 -*-
class TopicsController < ApplicationController
  # GET /topics
  # GET /topics.json
  
  skip_before_filter :is_login?, :only => [:index, :show, :search]
  before_filter :only_member_can_do, :except => [:index, :show, :search]

  def index
    @group = Group.find(1)
    @topics = @group.topics.includes(:person).includes(:last_replied_person).includes(:comments).order("last_replied_at desc").page(params[:page])      
    @people = Person.where(["role = ? or role = ? or role =? or role = ?", "学员", "老师", "助教", "admin"]).order("score desc").limit(12)

    @notes = Note.order("created_at desc").limit(10)
    @testings = Testing.order("created_at desc").limit(10)
    @resources = Resource.order("created_at desc").limit(10)
    @articles = Article.order("created_at desc").limit(10)
     
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group }
    end
  end
  
  def search
    if params[:query] == "" || params[:query].is_a?(NilClass)
      @topics = []
      flash.now[:notice] = "请输入搜索词语"
      render :search 
    else 
      @topics = Topic.where("title LIKE ?", "%"+params[:query]+"%").order("created_at desc").page(params[:page])
      respond_to do |format|
        format.html # search.html.erb
        format.json { render json: @topics }
      end
    end
    
  end

  
  def show
    @topic = Topic.find(params[:id])
    @latest_topics = Topic.order("last_replied_at desc").limit(10)   
    @comments = @topic.comments
    @comment = Comment.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @topic }
    end    
  end

  
  def new
    @topic = Topic.new
    @topic.group = Group.find(1)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @topic }
    end
  end
  
  # GET /topics/1/edit
  def edit
    if is_admin?
      @topic = Topic.find(params[:id])
    else
      @topic = current_person.topics.find(params[:id])
    end
    @group = @topic.group
  end


  # POST /topics
  # POST /topics.json
  def create
    @topic = current_person.topics.build(params[:topic])
    @topic.last_replied_at = Time.now
    respond_to do |format|
      if @topic.save
        @topic.person.update_column(:score,@topic.person.score+2)
        format.html { redirect_to @topic, notice: '创建成功' }
        format.json { render json: @topic, status: :created, location: @topic }
      else
        format.html { render action: "new" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /topics/1
  # PUT /topics/1.json
  def update
    if is_admin?
      @topic = Topic.find(params[:id])
    else
      @topic = current_person.topics.find(params[:id])
    end

    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        format.html { redirect_to @topic, notice: '更新成功' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    if is_admin?
      @topic = Topic.find(params[:id])
    else
      @topic = current_person.topics.find(params[:id])
    end
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to topics_path }
      format.json { head :no_content }
    end
  end  

  
end
