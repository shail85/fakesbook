class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user


  private

  def current_user_session
    if defined?(@user_session)
	 @current_user_session = @user_session
    else
    	 @current_user_session = UserSession.find
    end
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
	end
end
