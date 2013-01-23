# -*- encoding : utf-8 -*-
class DiscussionsController < ApplicationController
  # GET /discussions
  # GET /discussions.json

  skip_before_filter :is_login?, :only => [:index]
  before_filter :only_member_can_do, :except => [:index]
  before_filter :only_admin_can_do, :only => [:destroy]
  
  def index
    @classroom = Classroom.find(1)
    @discussions = @classroom.discussions.order("created_at desc").page(params[:page])
    @discussion = Discussion.new
    @upcoming_online_courses = Course.where("start_at > ? and online = ?", Time.now, "yes").limit(5).order("start_at")
    @this_week_online_course = @upcoming_online_courses.first
    @latest_online_courses = Course.where("start_at <= ? and online = ?", Time.now, "yes").limit(15).order("start_at desc")

    # @people = Person.where(["role = ? or role = ? or role =? or role = ?", "学员", "老师", "助教", "admin"]).order("score desc").page(params[:page])
    respond_to do |format|
     format.html # show.html.erb
     format.json { render json: @classroom }
    end
  end
  
  
  
  def create
    @discussion = current_person.discussions.build(params[:discussion])
    respond_to do |format|
      if @discussion.save        
        @discussion.person.update_column(:score,@discussion.person.score+1)
        format.html { redirect_to @discussion.classroom, notice: '创建成功' }
        format.json { render json: @discussion, status: :created, location: @discussion }
        format.js {}
      else
        format.html { redirect_to @discussion.classroom, notice: '创建失败' }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
        format.js { render 'append_fail_notice' }
      end
    end
  end

  # DELETE /discussions/1
  # DELETE /discussions/1.json
  def destroy
    if is_admin?
      @discussion = Discussion.find(params[:id])
    else
      @discussion = current_person.discussions.find(params[:id])
    end
    @discussion.destroy
    respond_to do |format|
      format.html { redirect_to discussions_path }
      format.json { head :no_content }
    end
  end

end
