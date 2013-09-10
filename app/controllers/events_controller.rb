# -*- encoding : utf-8 -*-
class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  skip_before_filter :is_login?, :only => [:index, :show]
  before_filter :only_admin_can_do, :except => [:index, :show]
  
  def index
    @events = Event.order("start_at desc").page(params[:page])      
    @cities = Event.select("city, count(city) as count").group(:city).order("count desc")
    @events = Event.where("city=?",params[:city]).page(params[:page]) if params[:city]    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @events }
    end
  end


  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
     
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create    
    @event = current_person.events.build(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to :xianchang, :notice => '创建成功' }
        format.json { render :json => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.json { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = current_person.events.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to :xianchang, :notice => '更新成功' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = current_person.events.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
end
