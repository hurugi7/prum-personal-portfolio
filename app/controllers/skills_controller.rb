class SkillsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: [:destroy]

  def index
    @user = User.find(session[:user_id])
    @categories = Category.all
    @skill = @user.skills.build
  end

  def new
    @name_params = params[:category_name]
    @id_params = params[:category_id]
    @user = User.find(session[:user_id])
    @skill = current_user.skills.build if logged_in?
  end

  def create
    @user = User.find(session[:user_id])
    @skill = current_user.skills.build(skill_params)
    if @skill.save
      flash[:notice] = "#{@skill.category.name}に#{@skill.name}を習得レベル#{@skill.level}で追加しました！"
      redirect_to skills_url
    else
      render 'skills/new', status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(session[:user_id])
    @skill = current_user.skills.find(params[:id])
    if @skill.update!(skill_params)
      flash[:success] = "#{@skill.name}の習得レベルを保存しました！"
      redirect_to skills_url
    else
    end
  rescue ActiveRecord::RecordInvalid => e  
    flash[:danger] = "習得レベルの保存に失敗しました。#{e.message}"
    render 'skills/index', status: :unprocessable_entity
  end

  def destroy
    @user = User.find(session[:user_id])
    @skill = @user.skills.find(params[:id])
    @skill.destroy
    flash[:danger] = "#{@skill.name}の項目を削除しました！"
    redirect_to skills_url, status: :see_other
  end

  private

    def skill_params
      params.require(:skill).permit(:name, :level, :category_id)
    end

    def correct_user
      @skills = current_user.skills.find_by(id: params[:id])
      redirect_to root_url, status: :see_other if @skills.nil?
    end

    def between_this_month(skill)
      skill.updated_at.between?(Time.current.beginning_of_month, Time.current.end_of_month)
    end
end
