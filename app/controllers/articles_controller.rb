# -*- encoding : utf-8 -*-
class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.json
  skip_before_filter :is_login?, :only => [:index, :show, :search]
  before_filter :only_admin_can_do, :except  => [:index, :show, :search]
  
  def index
    #如果分类浏览. 按照 category.name
    @path = params[:path]
    @article = Article.new
    @categories = Category.where(:typeable => "Article").includes(:articles).order("order_number")
    
    if params[:path] 
      @articles = Category.where("typeable = ? and path=?", "Article", params[:path])[0].articles.includes(:person).order("created_at desc").page(params[:page])      
    else
	    @articles = Article.includes(:person).order("created_at desc").page(params[:page])     
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end
  
  def search
    if params[:query] == "" || params[:query].is_a?(NilClass)
      @articles = []
      flash.now[:notice] = "请输入搜索词语"
      render :search 
    else 
      @articles = Article.where("title LIKE ?", "%"+params[:query]+"%").order("created_at desc").page(params[:page])
      respond_to do |format|
        format.html # search.html.erb
        format.json { render json: @articles }
      end
    end
    
  end
  

  # GET /articles/1
  # GET /articles/1.json
  def show
    @comment = Comment.new
    @article = Article.find(params[:id])
    @latest_articles = Article.order("created_at desc").limit(10)
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
   
    respond_to do |format|
      if @article.save
        @article.person.update_column(:score,@article.person.score+3)
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
    
    respond_to do |format|
      if @article.update_attributes(params[:article])
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
  
end

