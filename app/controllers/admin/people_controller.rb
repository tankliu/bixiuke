# -*- encoding : utf-8 -*-
class Admin::PeopleController < ApplicationController
  # GET /people
  # GET /people.json
  
  before_filter :only_admin_can_do
  
  def index
    @order_way = params[:order_way] || "score"
    @people = Person.order("score desc") if @order_way == "score"
    @people = Person.order("created_at desc") if @order_way == "join_time"
    @people = Person.order("city desc") if @order_way == "city"
    @people = Person.order("dead desc") if @order_way == "dead"
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @people }
    end
  end

  # GET /people/1
  # GET /people/1.json
  
end

