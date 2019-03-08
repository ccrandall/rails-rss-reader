class UsersController < ApplicationController
  before_action :save_login_state, :only => [:new, :create]
  #has_many :feeds

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You signed up successfully"
      flash[:color] = "valid"
    else
      flash[:notice] = "Form is invalid"
      flash[:color] = "invalid"
    end
    render "new"
  end
  
  def index
    render "sessions/home"
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # success
      flash[:success] = "Profile Updated."
      login_attempt @user
      redirect_to @user
    else
      render 'sessions/profile'
    end
  end
  
end