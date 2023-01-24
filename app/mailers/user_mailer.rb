class UserMailer < ApplicationMailer
    default from: 'notificaciones@voleyuc.com'

    def welcome_email
        @user = params[:user]
        @url  = new_user_session_url
        mail(to: @user.email, subject: 'Bienvenido a Voley UC!')
    end
end