class CreateRecurringTasksTasksJob < ApplicationJob
  queue_as :default

  def perform(recurring_task)
    # Do something later
  end
end
