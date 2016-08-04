module SessionsHelper
	def log_in(user)
		session[:user_id]= user.id
	end
	def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  def logged_in?
    !current_user.nil?
  end
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  def check_logged_in?
    if logged_in?
      @current_user = current_user
      if @current_user.admin == true
        render 'welcome'
      else
        render 'product'
      end
    end
  end
end
