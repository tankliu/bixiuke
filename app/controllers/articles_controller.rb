# -*- encoding : utf-8 -*-
class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.json
  skip_before_filter :is_login?, :only => [:index, :show]
  before_filter :only_admin_can_do, :except  => [:index, :show]
  
  def index
    #如果分类浏览. 按照 category.name
    @path = params[:path]
    @article = Article.new
    @categories = Category.where(:typeable => "Article").order("order_number")
    if params[:category_id]
      @articles = Category.find(params[:category_id]).articles.includes(:person).order("created_at desc").page(params[:page])      
    else
      @articles = Article.includes(:person).order("created_at desc").page(params[:page])      
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @comment = Comment.new
    @article = Article.find(params[:id])
    @comments = @article.comments
    @article.update_column(:views, @article.views + 1)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = current_person.articles.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create  
    
    @article = current_person.articles.build(params[:article])
    @article.views = 0
    if has_attachment_but_no_mark?
        flash.now[:notice] = "内容里忘记写站位符了。"
        render :action => "new" and return
    end
    replace_mark_with_picture
    
    respond_to do |format|
      if @article.save
        @article.person.update_column(:score,@article.person.score+2)
        format.html { redirect_to @article, notice: '创建成功' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = current_person.articles.find(params[:id])
    @article.attributes  = params[:article]
    if has_attachment_but_no_mark?
        flash.now[:notice] = "内容里忘记写站位符了。"
        render :action => "edit" and return
    end
    replace_mark_with_picture
    
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: '更新成功' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
   
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = current_person.articles.find(params[:id])
    @article.destroy
    
    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end
  
  
  private
  
  def has_attachment_but_no_mark?
    if !params[:article][:attachment].blank? and !params[:article][:content].include?("<picture>")
      return true
    else
      return false
    end          
  end
  
  def replace_mark_with_picture
    # 如果没有attachment,没必要对内容进行更好, 所以用unless,  img后内容里面增加<p></p>, 是为了css显示, 让后面的内容重新开始
    unless params[:article][:attachment].blank?
      @article.attachment_file_name = Time.now.to_i.to_s + rand(10000..99999).to_s + "_" + @article.attachment.original_filename
      image_url_for_content = "<img src='/system/articles/attachments/#{Date.today.to_s[0,7]}/#{@article.attachment_file_name}' alt='#{@article.title}' /><p></p>"
      @article.content = @article.content.sub!("<picture>",image_url_for_content)
    end
    
  end
  
end

