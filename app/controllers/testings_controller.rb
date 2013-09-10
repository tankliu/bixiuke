# -*- encoding : utf-8 -*-
class TestingsController < ApplicationController
  # GET /testings

  
  skip_before_filter :is_login?, :only => [:index, :show]
  before_filter :only_admin_can_do, :except => [:index, :show, :test]

  # GET /testings.json
  def index
    #用sql的rand函数来生成随机排序
    @testings = Testing.includes(:person).order("RAND()").limit(10)
    @grades = Grade.order("score desc").limit(100)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @testings }
    end
    
  end

  def test
    if params[:answer]
      results = params[:answer]
      keys = results.keys.map{|k| k.to_i}
      @testings = Testing.find(keys)
      score = 0 
      @testings.each do |testing| 
        if results[testing.id.to_s] == testing.answer.upcase
          score += 10 
        end
      end
      if is_login?       
        if current_person.grade 
          if current_person.grade.score < score
            current_person.grade.update_attributes!(:score => score)   
          end
        else
          grade  = Grade.new(:person => current_person, :score => score)
          grade.save!
        end
      end       
      notice_text = "你这次测试的分数是#{score}分"
    else
      notice_text = "你还没选择答案,请选择答案后提交"
    end
    respond_to do |format|
      format.html { redirect_to testings_path, notice: notice_text }
    end

  end
  
  
  # def test
  #   @testing = Testing.find(params[:testing_id])      
  #   if params[:answer] == @testing.answer.upcase
  #     @notice_text = "第"+@testing.id.to_s+"题:"+"恭喜你!答对了!你具有成为把妹达人的潜力!"
  #   else
  #     @notice_text = "第"+@testing.id.to_s+"题:"+"答错了!再接再厉!你需要继续学习!"
  #   end
  #   @rand_num = rand(1000)
  #   respond_to do |format|
  #     format.html{ redirect_to :back}
  #     format.json
  #     format.js {}
  #   end
  # end
  

  def new
    @testing = Testing.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @testing }
    end
  end
  
  def show

    @testing = Testing.find(params[:id])
    @latest_testings = Testing.order("created_at desc").limit(10)
    @comments = @testing.comments
    @comment = Comment.new

    respond_to do |format|
      format.html
      format.json {render json: @testing}
    end

  end
  # GET /testings/1/edit
  def edit
    if is_admin?
      @testing = Testing.find(params[:id])
    else
      @testing = current_person.testings.find(params[:id])
    end
  end

  # POST /testings
  # POST /testings.json
  def create
    @testing = current_person.testings.build(params[:testing])
    params[:options].each do |content|
      unless content == ""
        @testing.options<<Option.new(:content => content)
      end
    end
    
    respond_to do |format|
      if @testing.save
        @testing.person.update_column(:score,@testing.person.score+3)
        format.html { redirect_to @testing, notice: '创建成功' }
        format.json { render json: @testing, status: :created, location: @testing }
      else
        format.html { render action: "new" }
        format.json { render json: @testing.errors, status: :unprocessable_entity }
      end
    end      
  end

  # PUT /testings/1
  # PUT /testings/1.json
  def update
    if is_admin?
      @testing = Testing.find(params[:id])
    else
      @testing = current_person.testings.find(params[:id])
    end
    
    respond_to do |format|
      if @testing.update_attributes(params[:testing])    
        @testing.options.delete_all                  
        params[:options].each do |content|
          unless content == ""
            @testing.options<<Option.new(:content => content)
          end
        end
        format.html { redirect_to @testing, notice: '更新成功' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @testing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testings/1
  # DELETE /testings/1.json
  def destroy
    if is_admin?
      @testing = Testing.find(params[:id])
    else
      @testing = current_person.testings.find(params[:id])
    end
    @testing.destroy

    respond_to do |format|
      format.html { redirect_to testings_url }
      format.json { head :no_content }
    end
  end 

end
