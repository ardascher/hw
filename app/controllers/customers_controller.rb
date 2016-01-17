class CustomersController < ApplicationController
	def new
  end

  def show
  	@customer = Customer.find(params[:id])  	
  end

	def index
		@customers = Customer.all
	end

	def create
  	@customer = Customer.new(customer_params)
 
  	@customer.save
  	redirect_to @customer
  end

  private
    def customer_params
    params.require(:customers).permit(:first_name, :second_name, :e_mail)
  end
end
