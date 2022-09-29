class UserMailer < ApplicationMailer
  default from: ENV['gmail_username']

  def confirmation_email
    @user = params[:user]
    @url  = 'http://localhost:3000/users/sign_in'
    mail(to: @user.email, subject: 'Your Demon booking has been confirmed, enjoy your eternal damnation!')
  end
end
