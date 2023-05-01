# == Schema Information
#
# Table name: tasks
#
#  id                :uuid             not null, primary key
#  content           :text
#  done              :boolean          default(FALSE), not null
#  due_date          :datetime
#  name              :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  recurring_task_id :uuid
#
class Task < ApplicationRecord
  belongs_to :recurring_task, optional: true
  has_many :goal_task, dependent: :destroy
  has_many :goals, through: :goal_task
end
