class SessionsController < ApplicationController
  before_action :authenticate_user, :except => [:index, :login, :login_attempt, :logout]
  before_action :save_login_state, :only => [:index, :login, :login_attempt]

  	def home
  		#Home Page
  		@feeds = Feedlist.where("user_id=?", @current_user.id)
      render "home"
  	end

  	def profile
  		#Profile Page
      #redirect_to :action => 'users#edit'
  	end

  	def setting
  		#Setting Page
  	end

  	def login
  		#Login Form
  	end

  	def login_attempt
  		authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
  		if authorized_user
  			session[:user_id] = authorized_user.id
  			flash[:notice] = "Welcome again, #{authorized_user.username}"
  			redirect_to(:action => 'home')
  		else
  			flash[:notice] = "Invalid Username or Password"
          	flash[:color]= "invalid"
  			render "login"	
  		end
  	end

  	def logout
  		session[:user_id] = nil
  		redirect_to :action => 'login'
  	end
    
end
