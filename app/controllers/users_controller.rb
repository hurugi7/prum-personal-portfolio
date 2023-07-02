class UsersController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.avatar_image.attach(params[:user][:avatar_image]) if @user.avatar_image.blank?
    if @user.update(user_params)
      flash[:success] = "プロフィールが更新されました"
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
  def logged_in_user
    unless logged_in?
      flash[:danger] = "ログインしてください"
      redirect_to login_url, status: :see_other
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url, status: :see_other) unless @user == current_user
  end
end
