class ProductsController < ApplicationController
  before_filter :check_logged_in?, only: :new
	def index
	  @product=Product.all 
    @order_item = current_order.order_items.new
	end

	def new
    if current_user.admin !=  true
      flash[:eroors] = "You are not a admin"
      redirect_to current_user
    end  
		@product=Product.new
	end
	def create
      @product = Product.new(product_params)
    if @product.save
      flash[:success] = "Product has been added!"
      redirect_to new
    else
      render 'new'
    end
    end

    private
    def product_params
      params.require(:product).permit(:name, :brand_name, :url,:price, 
      	                                         :quantity)
    end
end
