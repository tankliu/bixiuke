# -*- encoding : utf-8 -*-
class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  skip_before_filter :is_login?,:only => []
  before_filter :only_member_can_do

  # POST /comments
  # POST /comments.json
  # def new
  #   @comment = Comment.new
  #   @add_comment_id = "add_comment_"+params[:commable_id]
  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @comment }
  #   end
  # end

  def create
    @comment = current_person.comments.build(params[:comment])

    respond_to do |format|
      if @comment.save
        notice = "创建成功"
        if @comment.commable.is_a?(Topic)
          @comment.commable.update_column(:last_replied_at, Time.now) 
          @comment.commable.update_column(:last_replied_by,current_person.id)
        end
      else
        notice = @comment.errors.full_messages.size.to_s+"个错误:"+format_error(@comment.errors.full_messages.join(","))
      end
      @comment.person.update_column(:score,@comment.person.score+1)
      format.html { redirect_to @comment.commable, notice: notice }
      format.json { render json: @comment, status: :created, location: @comment }
    end
  end


  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    if is_admin?
      @comment = Comment.find(params[:id])
    else
      @comment = current_person.comments.find(params[:id])
    end
    @commable = @comment.commable
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to @commable }
      format.json { head :no_content }
    end
  end

end
