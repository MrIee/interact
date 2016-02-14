class UsersController < ApplicationController
  before_action :check_if_logged_in, :only => [:edit, :update, :show_puzzles]

  def index
    @users = User.all.order(:created_at).reverse
  end

  def new
    @user = User.new
  end

  def create
    user_details = user_params
    user_details[:profile_picture] = "http://res.cloudinary.com/dtr4wot8a/image/upload/v1450935422/profile_sgpoeq.jpg"

    @user = User.new user_details
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
    user_details = nil

    if !user_update_params.empty?
      user_details = user_params
    end

    if !user_password_params.empty?
      user_details = user_password_params
    end

    if !user_profile_picture_params.empty? && params[:file]
      user_details = {}

      Cloudinary::Uploader.destroy(@user.public_id) unless !@user.public_id
      req = Cloudinary::Uploader.upload(params[:file], :width => 128, :height => 128, :crop => :scale)

      user_details[:profile_picture] = req["url"]
      user_details[:public_id] = req["public_id"]
    end

    if @user.update user_details
      redirect_to users_edit_path
    else
      render :edit
    end
  end

  def show
    @user = User.find params[:id]

    if params[:s]
      @puzzle = @user.puzzles.where("title ILIKE ?", "%#{params[:s]}%").paginate(page: params[:page])
    else
      @puzzle = @user.puzzles.paginate(page: params[:page])
    end

    respond_to do |format|
      format.html
      format.js
    end

  end

  def show_puzzles
    if params[:s]
      @puzzles = @current_user.puzzles.where("title ILIKE ?", "%#{params[:s]}%").paginate(page: params[:page])
    else
      @puzzles = @current_user.puzzles.paginate(page: params[:page])
    end

    respond_to do |format|
      format.html
      format.js
    end

  end

  def reset_password
  end

  def update_password
    if params[:email] && @user = User.where("email = ?", params[:email]).first
      new_password = SecureRandom.urlsafe_base64(6)
      @user.password = new_password

        if @user.save
          UserMailer.reset_password_email(@user, new_password).deliver
          redirect_to login_path
        else
          flash[:error] = "Email not is not registered to any user"
          render :reset_password
        end

    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
  end

  def user_update_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

  def user_password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def user_profile_picture_params
    params.require(:user).permit(:profile_picture)
  end

  def check_if_logged_in
    redirect_to root_path unless @current_user.present?
  end
end
