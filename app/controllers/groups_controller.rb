# -*- encoding : utf-8 -*-
class GroupsController < ApplicationController
  skip_before_filter :is_login?, :only => [:show]
  before_filter :only_admin_can_do, :except => [:show]

  # GET /groups/1
  # GET /groups/1.json
  def index  
   @groups = Group.includes(:person).order("created_at desc")
    respond_to do |format|
    format.html # index.html.erb
    format.json { render json: @groups }
   end
  end
  
  def show
    @group = Group.find(params[:id])
    @topics = @group.topics.order("created_at desc").page(params[:page])      
    @topic = @topic || Topic.new
    @people = Person.where(["role = ? or role = ? or role =? or role = ?", "学员", "老师", "助教", "admin"]).order("score desc").page(params[:page])
    @people_size = Person.all.size
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group }
      format.rss
    end
  end

  def new
    @group = Group.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @group = current_person.groups.find(params[:id])
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = current_person.groups.build(params[:group])

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: '创建成功' }
        format.json { render json: @group, status: :created, location: @group }
      else
        format.html { render action: "new", notice: '创建失败' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.json

  def update
    @group = current_person.groups.find(params[:id])
    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to @group, notice: '更新成功' }
        format.json { head :no_content }
      else
        
        format.html { render action: "edit", notice: "更新失败" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group = current_person.groups.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end
end
