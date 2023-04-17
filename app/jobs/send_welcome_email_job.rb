class SendWelcomeEmailJob < ApplicationJob

  queue_as :default

  def perform(user)
    CreateEmployeeJob.set(wait: 2.minutes).perform_later(user)
    UserMailer.welcome_email(user).deliver_now
  end
end
