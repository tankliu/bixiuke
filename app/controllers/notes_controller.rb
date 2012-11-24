# -*- encoding : utf-8 -*-
class NotesController < ApplicationController
  # GET /notes
  # GET /notes.json
  skip_before_filter :is_login?, :only => [:index, :show]
  before_filter :only_member_can_do, :except => [:index, :show]

  def index
    @note = Note.new
    @path = params[:path]
    @categories = Category.where(:typeable => "Note").order("order_number")
    if is_member? 
      if params[:path]
        @notes = Category.where("typeable=? and path=?","Note",params[:path])[0].notes.includes(:person).order("created_at desc").page(params[:page])      
      else
  	    @notes = Note.includes(:person).order("created_at desc").page(params[:page])      
      end
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @notes }
      end
    else
      if params[:path]
        case 
        when ["fangjian","asd","sex"].include?(params[:path])
          redirect_to :guangpan, notice:"高级惯例只有学员才可以浏览" and return
        else
          @notes = Category.where("typeable=? and path=?","Note",params[:path])[0].notes.includes(:person).order("created_at desc").page(params[:page])      
        end
      else
        categories_range = 29..34
        @notes = Note.where(:category_id => categories_range).order("created_at desc").page(params[:page])
      end
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @notes }
      end
    end
    
  end
  
  def show
    
    @note = Note.find(params[:id])
    @comments = @note.comments
    @comment = Comment.new
    unless is_member?
      if (35..37).include?(@note.category_id)
        redirect_to :guangpan, notice: "高级惯例只有学员可浏览" and return
      end
    end
    
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
        format.html { redirect_to notes_path, notice: '创建成功' }
        format.json { render json: @note, status: :created, location: @note }
      else
        format.html { redirect_to notes_path, notice: @note.errors.full_messages.size.to_s+"个错误:"+format_error(@note.errors.full_messages.join(","))}
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

