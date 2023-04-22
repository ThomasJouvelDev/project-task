# == Schema Information
#
# Table name: goal_tasks
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  goal_id    :uuid             not null
#  task_id    :uuid             not null
#
# Indexes
#
#  index_goal_tasks_on_goal_id  (goal_id)
#  index_goal_tasks_on_task_id  (task_id)
#
# Foreign Keys
#
#  fk_rails_...  (goal_id => goals.id)
#  fk_rails_...  (task_id => tasks.id)
#
class GoalTask < ApplicationRecord
  belongs_to :goal
  belongs_to :task
end
