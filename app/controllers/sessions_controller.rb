class SessionsController < ApplicationController
 def new
   check_logged_in?
 end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      @current_user = current_user
      if @current_user.admin == true
        render 'welcome'
      else
        render 'product'
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  def welcome
  end
  def product
  end
  
  def destroy
    log_out
    render 'new'
  end
end
