class UserMailer < ActionMailer::Base
    default from: 'notifications@interact-puzzle.herokuapp.com'

    def reset_password_email(user, password)
        @user = user
        @password = password
        @url = "https://interact-puzzle.herokuapp.com/login"
        mail(to: @user.email, subject: 'Reset Password - Interact Puzzle Account')
    end
end