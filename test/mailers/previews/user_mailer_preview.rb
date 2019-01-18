class UserMailerPreview < ActionMailer::Preview
  def order_email
    UserMailer.order_email(User.last, Order.last)
  end
 end