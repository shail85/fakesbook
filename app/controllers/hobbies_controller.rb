class HobbiesController < ApplicationController

  before_filter :protect
  def index
	redirect_to (:controller => :users, :action => :index)
  end
  def add
	@hobby = Hobby.new
  end
  def create
	if current_user
		@hobby = Hobby.new(params[:hobby])
		@hobby.user_id = current_user.id
		if @hobby.save
			redirect_to root_url
		end
	end
  end

  def edithobby
	@hobby_id = params[:id]
	@hobby = Hobby.find_by_id(@hobby_id)

  end

  def update
	if current_user
		@hobby = Hobby.find(params[:id])
		if @hobby.update_attributes(params[:hobby])
			redirect_to(:controller => :users, :action => :index)
		else
			render :action => 'edit_hobby'
		end
	end
  end


  def delete
	if current_user
		@hobby = Hobby.find(params[:id])
		@hobby.destroy
		redirect_to (:controller => :users, :action => :index)
	else
		redirect_to(:controller => :users_session, :action => 'new')
	end
  end

  private
	def protect
		if current_user == nil
		redirect_to(:controller => 'user_sessions', :action => 'new')
		return false
		end
	end
end
