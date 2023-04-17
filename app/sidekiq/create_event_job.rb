class CreateEventJob
  include Sidekiq::Job

  def perform
    last_login = DateTime.parse('2023-04-14 16:30:00')
    Event.create(name: Faker::Lorem.words(number: 3).join(" "), category: Faker::Lorem.word, entry_fees: Faker::Number.number(digits: 3), starting_time: last_login)
  end
end
