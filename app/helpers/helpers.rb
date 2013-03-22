helpers do
  def current_user
	  unless session[:user_id] == nil
	    @user ||= User.find(session[:user_id])
	  end
  end
end