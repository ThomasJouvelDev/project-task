# == Schema Information
#
# Table name: goals
#
#  id         :uuid             not null, primary key
#  completion :integer
#  reward     :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Goal < ApplicationRecord
  has_many :goal_task
  has_many :tasks, through: :goal_task

  def real_completion
    total_tasks = tasks.size
    total_tasks_done = tasks.filter { |t| t.done? }.size
    (total_tasks_done.to_f / total_tasks.to_f) * 100
  end
end
