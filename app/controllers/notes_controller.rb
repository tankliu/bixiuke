# -*- encoding : utf-8 -*-
class NotesController < ApplicationController
  # GET /notes
  # GET /notes.json
  skip_before_filter :is_login?, :only => [:index, :show, :search]
  before_filter :only_member_can_do, :except => [:index, :show, :search]

  def index
    @note = Note.new
    @path = params[:path]
    @categories = Category.where(:typeable => "Note").includes(:notes).order("order_number")
    if params[:path]
      @notes = Category.where("typeable=? and path=?","Note",params[:path])[0].notes.includes(:person).order("created_at desc").page(params[:page])      
    else
	    @notes = Note.includes(:person).order("created_at desc").page(params[:page])      
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @notes }
    end
    
  end

  def search
    if params[:query] == "" || params[:query].is_a?(NilClass)
      @notes = []
      flash.now[:notice] = "请输入搜索词语"
      render :search 
    else 
      @notes = Note.where("title LIKE ?", "%"+params[:query]+"%").order("created_at desc").page(params[:page])
      respond_to do |format|
        format.html # search.html.erb
        format.json { render json: @notes }
      end
    end
    
  end
  
  def new
    @note = Note.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @note }
    end
  end
    
  def show
    @note = Note.find(params[:id])
    @latest_notes = Note.order("created_at desc").limit(10)
    @comments = @note.comments
    @comment = Comment.new
    # unless is_member?
    #    if (35..37).include?(@note.category_id)
    #      redirect_to :guangpan, notice: "高级惯例只有学员可浏览" and return
    #    end
    #  end  
    
    @categories = Category.where(:typeable => "Note").order("order_number")
    
    respond_to do |format|
      format.html
      format.json {render json: @note}
    end
    
  end
  # GET /notes/1/edit
  def edit
    if is_admin?
      @note = Note.find(params[:id])
    else
      @note = current_person.notes.find(params[:id])
    end
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = current_person.notes.build(params[:note])

    respond_to do |format|
      if @note.save
        @note.person.update_column(:score,@note.person.score+3)
        format.html { redirect_to @note, notice: '创建成功' }
        format.json { render json: @note, status: :created, location: @note }
      else
        format.html { render action: "new" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
        
      end
    end
  end

  # PUT /notes/1
  # PUT /notes/1.json
  def update
    if is_admin?
      @note = Note.find(params[:id])
    else
      @note = current_person.notes.find(params[:id])
    end

    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to @note, notice: '更新成功' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    if is_admin?
      @note = Note.find(params[:id])
    else
      @note = current_person.notes.find(params[:id])
    end
    
    @note.destroy

    respond_to do |format|
      format.html { redirect_to notes_url }
      format.json { head :no_content }
    end
  end 
end

