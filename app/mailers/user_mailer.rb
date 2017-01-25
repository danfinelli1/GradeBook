class UserMailer < ApplicationMailer

    default from: 'gradebook321@gmail.com'

  def welcome_email(user)
   @user = user
   @url  = 'http://mighty-sands-39800.herokuapp.com/'
   mail(to: @user.email, subject: 'Welcome to GradeBook!')
  end
end
