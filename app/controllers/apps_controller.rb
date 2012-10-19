# -*- encoding : utf-8 -*-
class AppsController < ApplicationController
  # GET /apps
  skip_before_filter :is_login?, :only => [:index, :show]
  before_filter :only_member_can_do, :except => [:index, :show]

  # GET /apps.json
  def index
    @app = App.new
    @apps = App.includes(:person).order("created_at desc").page(params[:page])     
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @apps }
    end
  end

  def test
    @app = App.find(params[:app_id])      
    if params[:answer] == @app.answer.upcase
      notice_text = "恭喜你!答对了!你具有成为把妹达人的潜力!"
    else
      notice_text = "答错了!再接再厉!你需要继续学习!"
    end
    respond_to do |format|
      format.html{ redirect_to :back, notice: notice_text }
      format.json
    end
  end
  

  def show

    @app = App.find(params[:id])
    @comments = @app.comments
    @comment = Comment.new

    respond_to do |format|
      format.html
      format.json {render json: @app}
    end

  end
  # GET /apps/1/edit
  def edit
    if is_admin?
      @app = App.find(params[:id])
    else
      @app = current_person.apps.find(params[:id])
    end
  end

  # POST /apps
  # POST /apps.json
  def create
    @app = current_person.apps.build(params[:app])
    params[:options].each do |content|
      unless content == ""
        @app.options<<Option.new(:content => content)
      end
    end
    if @app.options.size < 2
      redirect_to apps_path, notice: "一个错误:选项至少要填写两个" 
    else
      respond_to do |format|
        if @app.save
          @app.person.update_column(:score,@app.person.score+3)
          format.html { redirect_to apps_path, notice: '创建成功' }
          format.json { render json: @app, status: :created, location: @app }
        else
          format.html { redirect_to apps_path, notice: @app.errors.full_messages.size.to_s+"个错误:"+format_error(@app.errors.full_messages.join(","))}
          format.json { render json: @app.errors, status: :unprocessable_entity }
        end
      end      
    end
  end

  # PUT /apps/1
  # PUT /apps/1.json
  def update
    if is_admin?
      @app = App.find(params[:id])
    else
      @app = current_person.apps.find(params[:id])
    end
    
    respond_to do |format|
      if @app.update_attributes(params[:app])    
        @app.options.delete_all                  
        params[:options].each do |content|
          unless content == ""
            @app.options<<Option.new(:content => content)
          end
        end
        format.html { redirect_to @app, notice: '更新成功' }
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
    if is_admin?
      @app = App.find(params[:id])
    else
      @app = current_person.apps.find(params[:id])
    end
    @app.destroy

    respond_to do |format|
      format.html { redirect_to apps_url }
      format.json { head :no_content }
    end
  end 

end
