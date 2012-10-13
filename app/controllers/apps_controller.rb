# -*- encoding : utf-8 -*-
class AppsController < ApplicationController
  # GET /apps
  skip_before_filter :is_login?, :only => [:index, :test]
  before_filter :only_admin_can_do, :except => [:index, :test]

  # GET /apps.json
  def index
    @apps = App.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @apps }
    end
  end
  
  def test
    if is_member?
      if params[:question1] == "C" and params[:question2] == "C" and params[:question3] == "B"
        notice_text = "恭喜你!你具有成为把妹达人的潜力!"
      else
        notice_text = "你还需要再接再励才能具有把妹达人的潜力!加油学习!"
      end
    else
      notice_text = "你还不是学员不能参加测试,如果是学员请先登录,如果不是学员请联系客服成为学员."
    end
    respond_to do |format|
      format.html{ redirect_to apps_path, notice: notice_text }
      format.json
    end
    
  end
  
  def test2 
    if is_member?
      if params[:test2] == "A"
        notice_text = "恭喜你!你具有成为把妹达人的潜力!"
      else
        notice_text = "你还需要再接再励才能具有把妹达人的潜力!加油学习!"
      end
    else
      notice_text = "你还不是学员不能参加测试,如果是学员请先登录,如果不是学员请联系客服成为学员."
    end
    respond_to do |format|
      format.html{ redirect_to apps_path, notice: notice_text }
      format.json
    end
  end

  # GET /apps/1
  # GET /apps/1.json
  def show
    @app = App.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @app }
    end
  end

  # GET /apps/new
  # GET /apps/new.json
  def new
    @app = App.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @app }
    end
  end

  # GET /apps/1/edit
  def edit
    @app = App.find(params[:id])
  end

  # POST /apps
  # POST /apps.json
  def create
    @app = App.new(params[:app])

    respond_to do |format|
      if @app.save
        format.html { redirect_to @app, notice: 'App was successfully created.' }
        format.json { render json: @app, status: :created, location: @app }
      else
        format.html { render action: "new" }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /apps/1
  # PUT /apps/1.json
  def update
    @app = App.find(params[:id])

    respond_to do |format|
      if @app.update_attributes(params[:app])
        format.html { redirect_to @app, notice: 'App was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apps/1
  # DELETE /apps/1.json
  def destroy
    @app = App.find(params[:id])
    @app.destroy

    respond_to do |format|
      format.html { redirect_to apps_url }
      format.json { head :no_content }
    end
  end
end
