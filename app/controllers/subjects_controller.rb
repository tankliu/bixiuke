# -*- encoding : utf-8 -*-
class SubjectsController < ApplicationController
  # GET /subjects
  # GET /subjects.json
  skip_before_filter :is_login?, :only => [:index]
  before_filter :only_member_can_do, :except => [:index]

  def index
    @subject = Subject.new
	  @subjects = Subject.includes(:user).order("order_number")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subjects }
    end
  end

  def show

    @subject = Subject.find(params[:id]).include(:notes)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subject }
    end
  end
  

  # GET /subjects/1/edit
  def edit
    @subject = current_user.subjects.find(params[:id])
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = current_user.subjects.build(params[:subject])
    @subject.cheers = 0

    respond_to do |format|
      if @subject.save
        format.html { redirect_to @subject.user, notice: '创建成功' }
        format.json { render json: @subject, status: :created, location: @subject }
      else
        format.html { redirect_to @subject.user, notice: '创建失败' }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /subjects/1
  # PUT /subjects/1.json
  def update
    @subject = current_user.subjects.find(params[:id])

    respond_to do |format|
      if @subject.update_attributes(params[:subject])
        format.html { redirect_to subjects_path, notice: '更新成功' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject = current_user.subjects.find(params[:id])
    @subject.destroy

    respond_to do |format|
      format.html { redirect_to subjects_url }
      format.json { head :no_content }
    end
  end

end
