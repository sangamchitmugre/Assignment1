class UsersController < ApplicationController
	def index
  end
	def help
	end
	def new
	 @user = User.new  
	end
	def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "user has been added!"
      redirect_to new
    else
      render 'new'
    end
   end

  private
  def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end

