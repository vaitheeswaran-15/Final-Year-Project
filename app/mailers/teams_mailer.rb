class TeamsMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    @team = params[:teams]
    @url  = 'http://localhost.com'
    mail(to: @user, subject: 'Welcome to our team!!! ')
  end
end
