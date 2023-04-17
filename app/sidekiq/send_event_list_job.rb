class SendEventListJob
  include Sidekiq::Job

  def perform
    UserMailer.send_event_list(Event.all).deliver_now
  end
end
