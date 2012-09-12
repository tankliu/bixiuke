# -*- encoding : utf-8 -*-
class ResourcesController < ApplicationController
  # GET /resources
  # GET /resources.json
  skip_before_filter :is_login?, :only => [:index, :show]
  before_filter :only_member_can_do, :except => [:index, :show]

  def index
    @order_number = params[:order_number].to_i
    @resource = Resource.new
    @categories = Category.where(:typeable => "Resource").order("order_number")
    if params[:order_number] 
      @resources = Category.where("typeable = ? and order_number=?", "Resource", params[:order_number])[0].resources.includes(:person).order("created_at desc").page(params[:page])      
    else
	    @resources = Resource.includes(:person).order("created_at desc").page(params[:page])     
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resources }
    end
  end

  
  def show
    @resource = Resource.find(params[:id])
    @comments = @resource.comments
    @comment = Comment.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @resource }
    end
  end

  # GET /resources/new
  # GET /resources/new.json



  # GET /resources/1/edit
  def edit
    @resource = current_person.resources.find(params[:id])
  end

  # POST /resources
  # POST /resources.json
  def create
    @resource = current_person.resources.build(params[:resource])

    respond_to do |format|
      if @resource.save
        @resource.person.update_column(:score,@resource.person.score+3)
        format.html { redirect_to resources_path, notice: '创建成功' }
        format.json { render json: @resource, status: :created, location: @resource }
      else
        format.html { redirect_to resources_path, notice: '创建失败' }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resources/1
  # PUT /resources/1.json
  def update
    @resource = current_person.resources.find(params[:id])

    respond_to do |format|
      if @resource.update_attributes(params[:resource])
        format.html { redirect_to resources_path, notice: '更新成功' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource = current_person.resources.find(params[:id])
    @resource.destroy

    respond_to do |format|
      format.html { redirect_to resources_url }
      format.json { head :no_content }
    end
  end
  
  # def replace_mark_with_picture
  #     # 如果没有attachment,没必要对内容进行更好, 所以用unless,  img后内容里面增加<p></p>, 是为了css显示, 让后面的内容重新开始
  #     unless params[:resource][:cover].blank?
  #       @article.attachment_file_name = Time.now.to_i.to_s + rand(10000..99999).to_s + "_" + @article.attachment.original_filename
  #       image_url_for_content = "<img src='/system/articles/attachments/#{Date.today.to_s[0,7]}/#{@article.attachment_file_name}' /><p></p>"
  #       @article.content = @article.content.sub!("<picture>",image_url_for_content)
  #     end
  #     
  #   end
  
end
