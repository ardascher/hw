class OrderMailer < ActionMailer::Base
  default from: "tvink.odin@gmail.com"

  def order_email(customer)
    @customer = customer
    mail(to: @customer.e_mail, subject: 'You are created order on my site!')
  end

  def order_created(customer)
  	@customer = customer
  	mail(to: 'pasha.tuta@mail.ru', subject: 'Was created new order!')
  end
end
