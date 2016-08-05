class UsersController < ApplicationController
	  before_filter :check_logged_in?, only: :show


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
  def show
    if current_user.admin == false
      redirect_to products_path
    end 
  end 
  private
  def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end

