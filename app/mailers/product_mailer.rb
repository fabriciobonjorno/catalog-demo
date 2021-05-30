class ProductMailer < ApplicationMailer
  def send_detach_product(product, company, subscriber)
    @product = product
    @company = company
    @subscriber = subscriber
    mail(from: @company.email, to: @subscriber.email, subject: 'Temos uma novidade fresquinha para você!')
  end
end
