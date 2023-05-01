class CreateRecurringTasksTasksJob < ApplicationJob
  queue_as :default

  def perform
    RecurringTask.all.find_each do |r_task|
      today = Time.zone.today
      case r_task.recurrence
      when 'daily'
        attrs = { name: r_task.name, content: r_task.content, due_date: today, recurring_task: r_task}
        next if Task.find_by(attrs).present?

        Task.create!(attrs).tap do |task|
          GoalTask.create!(task:, goal: r_task.goal)
        end
      when 'weekly'
        attrs = { name: r_task.name, content: r_task.content, due_date: today.end_of_week, recurring_task: r_task}
        next if Task.find_by(attrs).present?

        Task.create!(attrs).tap do |task|
          GoalTask.create!(task:, goal: r_task.goal)
        end
      when 'monthly'
        attrs = { name: r_task.name, content: r_task.content, due_date: today.end_of_month, recurring_task: r_task}
        next if Task.find_by(attrs).present?

        Task.create!(attrs).tap do |task|
          GoalTask.create!(task:, goal: r_task.goal)
        end
    end
    end
  end
end
