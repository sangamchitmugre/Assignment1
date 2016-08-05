class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  helper_method :current_order

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
  def check_logged_in?
    if !logged_in?
      
      redirect_to login_path 
    end    
  end
  def check_admin?
      if current_user.admin != true
        flash[:errors]= "You are not an admin"
        redirect_to current_user
    end    
  end

end
