class WelcomeUserJob < ApplicationJob
  queue_as :emails

  def perform(user)
    UserNotifierMailer.send_signup_email(user).deliver_now
  end
end
