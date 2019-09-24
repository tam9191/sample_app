class UsersController < ApplicationController
  before_action :set_user, only: %i(show edit update destroy)
  before_action :logged_in_user, only: %i(index show edit update destroy)
  before_action :admin_user, only: %i(index destroy)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_or_correct_user, only: %i(show)
  
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def show
  end

  def new
    if logged_in? && !current_user.admin?
      flash[:info] = 'すでにログインしています。'
      redirect_to current_user
    end
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザーを更新しました"
      redirect_to @user
    else
      render :edit
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "ユーザーを削除しました"
    redirect_to users_url
  end
  
  
  private
  
    def set_user
      @user = User.find(params[:id])
    end
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
end
