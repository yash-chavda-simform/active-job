class UserMailer < ApplicationMailer
  default from: 'demo42424242@gmail.com'
  
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "User Is Created.")
  end

  def send_event_list(events)
    @events = events
    mail(to: User.pluck(:email), subject: "Event List")
  end

  def send_reminder_email(events)
    @events = events 
    @events.each do |event|
      @current_event = event
      mail(to: event.users.pluck(:email), subject: "Event Reminder")
    end
  end
end
