class CustomersController < ApplicationController
	def new
		@customer = Customer.new
  end

  def show
  	@customer = Customer.find(params[:id])  	
  end

	def index
		@customers = Customer.all
	end

	def create
  	@customer = Customer.new(customer_params)
  	respond_to do |format| 
  		if @customer.save 
  			 OrderMailer.order_email(@customer).deliver
  		   format.html { redirect_to(@customer, notice: 'Order was successfully created.') }
         format.json { render json: @customer, status: :created, location: @customer }
         OrderMailer.order_created(@customer).deliver
      else
         format.html { render action: 'new' }
         format.json { render json: @customer.errors, status: :unprocessable_entity }
      end

  	end
  end 


  private
    def customer_params
    params.require(:customers).permit(:first_name, :last_name, :e_mail)
  end
end
