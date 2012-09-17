# -*- encoding : utf-8 -*-
class ClassroomsController < ApplicationController
   skip_before_filter :is_login?, :only => [:show]
   before_filter :only_admin_can_do, :except => [:show]

   def index  
     @classrooms = Classroom.includes(:person).order("created_at desc")
     respond_to do |format|
       format.html # index.html.erb
       format.json { render json: @classrooms }
     end
   end
   
   def show
     @classroom = Classroom.find(params[:id])
     @discussions = @classroom.discussions.order("created_at desc").page(params[:page])
     @discussion = Discussion.new
     @people = Person.where(["role = ? or role = ? or role =? or role = ?", "学员", "老师", "助教", "admin"]).order("score desc").page(params[:page])
     respond_to do |format|
       format.html # show.html.erb
       format.json { render json: @classroom }
     end
   end

   def new
     @classroom = Classroom.new
     respond_to do |format|
       format.html # new.html.erb
       format.json { render json: @classroom }
     end
   end

   # GET /classrooms/1/edit
   def edit
     @classroom = current_person.classrooms.find(params[:id])
   end

   # POST /classrooms
   # POST /classrooms.json
   def create
     @classroom = current_person.classrooms.build(params[:classroom])

     respond_to do |format|
       if @classroom.save
         format.html { redirect_to @classroom, notice: '创建成功' }
         format.json { render json: @classroom, status: :created, location: @classroom }
       else
         format.html { render action: "new", notice: '创建失败' }
         format.json { render json: @classroom.errors, status: :unprocessable_entity }
       end
     end
   end

   # PUT /classrooms/1
   # PUT /classrooms/1.json
   def update
     @classroom = current_person.classrooms.find(params[:id])

     respond_to do |format|
       if @classroom.update_attributes(params[:classroom])
         format.html { redirect_to @classroom, notice: '更新成功' }
         format.json { head :no_content }
       else
         format.html { render action: "edit", notice: "更新失败" }
         format.json { render json: @classroom.errors, status: :unprocessable_entity }
       end
     end
   end

   # DELETE /classrooms/1
   # DELETE /classrooms/1.json
   def destroy
     @classroom = current_person.classrooms.find(params[:id])
     @classroom.destroy

     respond_to do |format|
       format.html { redirect_to classrooms_url }
       format.json { head :no_content }
     end
   end
end
