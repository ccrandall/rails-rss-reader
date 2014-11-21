class FeedsController < ApplicationController
  before_filter :authenticate_user
  
  def index
    @feeds = Feedlist.where("user_id=?", @current_user.id)
  end
  
  def feed_params
    params.require(:feed).permit(:user_id, :feed_name, :feed_url, feed_attributes: [:feed_name, :feed_url, :user_id])
  end
  
  def new
    @feed = Feedlist.new()
  end

  def create
    @feed = Feedlist.new(feed_params)
    @feed_urls = Feedlist.where("user_id=?", @current_user.id).pluck("feed_url")
    if @feed_urls.include? feed_params[:feed_url] 
			flash[:notice] = "Feed URL must be unique. This feed already exists."
      flash[:color]= "invalid"
			render "/feeds/new"
    else
      if @feed.save
        redirect_to '/feeds'
      else
  			#flash[:notice] = "Feed URL must be unique. This feed already exists."
        #flash[:color]= "invalid"
  			render "/feeds/new"	
      end
    end
  end

  def feed_articles
    #@feed_url = Feedlist.all.where("user_id=? AND id=?", params[:user_id], params[:id])
    @feed_data = Feedlist.where("user_id=? AND id=?", @current_user.id, params[:id]).select("feed_url, feed_name")
    @feed_data.each do |f|
      @feed_name = f['feed_name']
      @feed_url = f['feed_url']
    end
    #render 'feed_articles'
  end
  
  def edit
    @feed = Feedlist.find(params[:id])
    @feed_name = @feed['feed_name']
    @feed_url = @feed['feed_url']
  end
  
  def update
    @feed = Feedlist.find(params[:id])
    @feed.update_attributes(:feed_name => params[:feed][:feed_name], :feed_url => params[:feed][:feed_url])
    
    if @feed.save
      redirect_to '/home'
    else
      redirect_to :action => "edit"
      
      if @feed.errors.messages[:feed_url]
			  flash[:notice] = "Feed URL is required"
        flash[:color]= "invalid"
      elsif @feed.errors.messages[:feed_name]
			  flash[:notice] = "Feed name is required and must be at least 3 characters."
        flash[:color]= "invalid"
      else
			  flash[:notice] = "Both fields are required, please try again."
        flash[:color]= "invalid"
      end
    end
  end
  
  def show
    #@user = User.find(params[:id])
    @feed = Feedlist.find(params[:user_id])
  end

end
