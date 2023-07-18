class UsersController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user
  def show
    @user = User.find(params[:id])

    @back_skills_2M_ago = Skill.where('category_id=?', 1)
                          .where(updated_at: ..Time.now.months_ago(2).end_of_month)
                          .order(updated_at: :desc).to_a.uniq { |n| n[:name] }
                          .pluck(:level).sum

    @back_skills_last_month = Skill.where('category_id=?', 1)
                              .where(updated_at: ..Time.now.months_ago(1).end_of_month)
                              .order(updated_at: :desc).to_a.uniq { |n| n[:name] }
                              .pluck(:level).sum

    @back_skills_this_month = Skill.where('category_id=?', 1)
                              .where(updated_at: ..Time.now.end_of_month)
                              .order(updated_at: :desc).to_a.uniq { |n| n[:name] }
                              .pluck(:level).sum


    @front_skills_2M_ago = Skill.where('category_id=?', 2)
                          .where(updated_at: ..Time.now.months_ago(2).end_of_month)
                          .order(updated_at: :desc).to_a.uniq { |n| n[:name] }
                          .pluck(:level).sum

    @front_skills_last_month = Skill.where('category_id=?', 2)
                              .where(updated_at: ..Time.now.months_ago(1).end_of_month)
                              .order(updated_at: :desc).to_a.uniq { |n| n[:name] }
                              .pluck(:level).sum

    @front_skills_this_month = Skill.where('category_id=?', 2)
                              .where(updated_at: ..Time.now.end_of_month)
                              .order(updated_at: :desc).to_a.uniq { |n| n[:name] }
                              .pluck(:level).sum


    @infra_skills_2M_ago = Skill.where('category_id=?', 3)
                          .where(updated_at: ..Time.now.months_ago(2).end_of_month)
                          .order(updated_at: :desc).to_a.uniq { |n| n[:name] }
                          .pluck(:level).sum

    @infra_skills_last_month = Skill.where('category_id=?', 3)
                              .where(updated_at: ..Time.now.months_ago(1).end_of_month)
                              .order(updated_at: :desc).to_a.uniq { |n| n[:name] }
                              .pluck(:level).sum

    @infra_skills_this_month = Skill.where('category_id=?', 3) 
                              .where(updated_at: ..Time.now.end_of_month)
                              .order(updated_at: :desc).to_a.uniq { |n| n[:name] }
                              .pluck(:level).sum

    @back_chart = [@back_skills_2M_ago, @back_skills_last_month, @back_skills_this_month]
    @front_chart = [@front_skills_2M_ago, @front_skills_last_month, @front_skills_this_month]
    @infra_chart = [@infra_skills_2M_ago, @infra_skills_last_month, @infra_skills_this_month]

    @months = [
      Date.today.months_ago(2).strftime("%B"),
      Date.today.last_month.strftime("%B"),
      Date.today.strftime("%B")]

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.avatar_image.attach(params[:user][:avatar_image]) if @user.avatar_image.blank?
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  private 

  def user_params 
    params.require(:user).permit(:introduce_messages, :avatar_image)
  end

  # beforeフィルタ
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url, status: :see_other) unless @user == current_user
  end
end
