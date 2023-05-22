class EventReminderJob
  include Sidekiq::Job

  def perform
    @event = Event.where("EXTRACT(hour FROM (starting_time - ?)) = ?", Time.current, 5)
    UserMailer.send_reminder_email(@event).deliver_now
  end
end
