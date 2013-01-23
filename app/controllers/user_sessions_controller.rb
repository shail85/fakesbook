class UserSessionsController < ApplicationController
	def new
		@user_session = UserSession.new
		 respond_to do |format|
      		format.html # new.html.erb
      		format.xml  { render :xml => @user_session }
    		end
	end
	def create
		@user_session = UserSession.new(params[:user_session])
		if @user_session.save
			redirect_to root_url
		else
			render :action => 'new'
		end
	end
	def destroy
		@user_session = UserSession.find
		@user_session.destroy
		redirect_to root_url
	end
end
