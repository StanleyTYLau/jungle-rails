class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.preview.subject
  #

  default from: 'no-reply@jungle.com'

  

  def order_email(user, order)
    @user = user
    @order = order
    @products = LineItem.where(order_id: order.id)
    mail(to: @user.email, subject: "Jungle Purchase Confirmed - Order: #{order.id}")
  end
end
