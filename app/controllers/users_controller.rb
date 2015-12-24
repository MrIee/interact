class UsersController < ApplicationController
  before_action :check_if_logged_in, :only => [:edit, :update]

  def index
    @users = User.all.order(:created_at).reverse
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
        redirect_to(root_path)
    else
        render :new
    end
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user
    @user.update user_params
    redirect_to root_path
  end

  def show_puzzles
    @puzzle = @current_user.puzzles
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
  end

  def check_if_logged_in
    redirect_to root_path unless @current_user.present?
  end
end
