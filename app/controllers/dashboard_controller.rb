class DashboardController < ApplicationController
  def index
    @tasks = Task.all.order(:created_at)
    @goals = Goal.all.order(:created_at)
    @recurring_tasks = RecurringTask.all.order(:created_at)
  end

  def generate_recurring_tasks_tasks
    CreateRecurringTasksTasksJob.perform_now

    redirect_to root_path
  end
end
