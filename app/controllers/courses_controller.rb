# -*- encoding : utf-8 -*-
class CoursesController < ApplicationController
  # GET /courses
  # GET /courses.json
  skip_before_filter :is_login?, :only => [:index, :show]
  before_filter :only_admin_can_do, :except => [:index, :show]
  
  def index
    @courses = Course.order("start_date desc").page(params[:page])      
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @courses }
    end
  end


  # GET /courses/new
  # GET /courses/new.json
  def new
    @course = Course.new
     
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.json
  def create    
    @course = current_person.courses.build(params[:course])

    respond_to do |format|
      if @course.save
        format.html { redirect_to courses_url, :notice => '创建成功' }
        format.json { render :json => @course, :status => :created, :location => @course }
      else
        format.html { render :action => "new" }
        format.json { render :json => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @course = current_person.courses.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to courses_url, :notice => '更新成功' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = current_person.courses.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end
end
