class User < ApplicationRecord
  has_and_belongs_to_many :events, join_table: :events_users
  has_secure_password
  after_create_commit { SendWelcomeEmailJob.perform_later(self) }
end
