class CreateEmployeeJob < ApplicationJob
  queue_as :default
  def perform(user)
    Employee.create(first_name: user.first_name, last_name: user.last_name)
  end
end
