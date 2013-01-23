class SitesController < ApplicationController
before_filter :protect, :except => [:login, :index]

	def index
		#render :text => 'hello world'
		@title = 'Fakebook'
	end
	def about
		render :text => 'Here goes the text for about us page'
		@title ='About Us'
	end
	def help
				render :text => 'Here goes the text for help page'
	end

#protected method should always be in end otherwise it will give a controller not found error
	private
	def protect
		if current_user == nil
		redirect_to(:controller =>'user_sessions', :action => 'new')
		return false
		end
	end
end
