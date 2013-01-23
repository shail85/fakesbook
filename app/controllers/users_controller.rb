class UsersController < ApplicationController

#before_filter :protect, :except => [:register, :new,]
  def index
	@users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
      respond_to do |format|
	if @user.save
	 format.html { redirect_to(root_url, :notice => 'Registration Successful') }
	 format.xml  { render :xml => @user, :status => :created, :location => @user }
	else
	 format.html { render :action => "new" }
	 format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
	end
	end
  end

  def profile
	@user_profile = params[:id]
	@title = "User profile for #{@user_profile}"
	@user_profile = User.find_by_username(@user_profile)
  end
  def find_by_town
	@user_from = params[:id]
	@title = "All users from #{@user_from}"
	@user_all = User.find(:all, :conditions => "town ='#{@user_from}'" )
  end

  def edit
	@user = User.find(params[:id])
  end

  def update
	@user = User.find(params[:id])
	if @user.update_attributes(params[:user])
	 redirect_to root_url, :notice  => "Successfully updated user."
	else
	 render :action => 'edit'
	end
  end

end
