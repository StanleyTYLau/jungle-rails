class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.preview.subject
  #

  default from: 'notifications@example.com'

  def preview
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  def welcome_email(user, order)
    @user = user
    @order = order
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Jungle Purchase Confirmed - Order: #{@order.id}')
  end
end
