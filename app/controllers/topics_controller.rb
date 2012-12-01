# -*- encoding : utf-8 -*-
class TopicsController < ApplicationController
  # GET /topics
  # GET /topics.json

  skip_before_filter :is_login?, :only => [:index, :show]
  before_filter :only_member_can_do, :except => [:index, :show]

  def index
    @topic = Topic.new
	  @topics = Topic.includes(:person).order("created_at desc").page(params[:page])      

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @topics }
    end
  end
  
  def show
    @topic = Topic.find(params[:id])
    @comments = @topic.comments
    @comment = Comment.new
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
        format.html { redirect_to @topic.group, notice: '创建成功' }
        format.json { render json: @topic, status: :created, location: @topic }
      else
        format.html { redirect_to @topic.group, notice: @topic.errors.full_messages.size.to_s+"个错误:"+format_error(@topic.errors.full_messages.join(",")) }
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
      format.html { redirect_to @topic.group }
      format.json { head :no_content }
    end
  end  

  
end
