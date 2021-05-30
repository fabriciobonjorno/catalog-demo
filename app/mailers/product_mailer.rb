class ProductMailer < ApplicationMailer
  def send_detach_product(product, company)
    @product = product
    @company = company
    mail(to: 'fabriciocomeli@gmail.com', subject: 'Testando')
  end
end
