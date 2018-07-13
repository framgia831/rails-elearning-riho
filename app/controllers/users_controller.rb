class UsersController < ApplicationController
  before_action :require_login, only: [:index, :edit, :update, :destroy, :following, :followers]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user,     only: :destroy



  def index
    @users = User.paginate(page: params[:page], per_page: 15)
  end
  
  def new
    @user = User.new
  end 

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @lessons = @user.lessons

    # @lessons.each do |lesson|
    #   n = @lessons.count
    #   lesson.words.count 
    #   end 

    # end
    # @lessons = Lesson.where(user_id: current_user.id)

    @j = 0 
    @lessons.each do |lesson|
      i = lesson.category.words.count.to_i
      @j += i
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash.now[:success] = "Updated your information successfully."
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    user = User.find(params[:id])
    flash[:success] = "User deleted."
    user.destroy
    redirect_to users_path
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page], per_page: 15)
    @avatar_users = @user.following
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page], per_page: 15)
    @avatar_users = @user.followers
    render 'show_follow'
  end

  private 
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def require_login
    unless logged_in?
      store_location
      flash.now[:danger] = "Please log in."
      redirect_to login_path
    end
  end

    # 正しいユーザーかどうか確認
  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path unless current_user?(@user)
  end
end
