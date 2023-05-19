class User < ApplicationRecord
  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: true
  
  has_and_belongs_to_many :events, join_table: :events_users
  has_secure_password
  after_create_commit :send_welcome_email, :create_employee
  
  def send_welcome_email
    SendWelcomeEmailJob.perform_later(self) 
  end

  def create_employee
    CreateEmployeeJob.set(wait: 2.minutes).perform_later(self)
  end
end
