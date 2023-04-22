class GoalTasksController < ApplicationController
  def new
    @goal = Goal.find(params[:id])
    @goal_task = GoalTask.new
    @tasks = Task.all.order(:created_at).filter { |task| @goal.tasks.exclude?(task) }.map { |t| [t.name, t.id]}
  end

  def create
    @goal = Goal.find(params[:id])
    @goal_task = GoalTask.new(goal_id: @goal.id, task_id: params[:task_id])
    @goal_task.save!
    redirect_to goal_path(@goal)
  end

  private
end
