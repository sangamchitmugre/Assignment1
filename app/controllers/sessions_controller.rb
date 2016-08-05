class SessionsController < ApplicationController
 def new
   if logged_in?
    redirect_to current_user
   end 
 end

  def create

    user = User.find_by(email: params[:session][:email].downcase)
    
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      @current_user = current_user
        redirect_to @current_user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to login_path
  end
end
