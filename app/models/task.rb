# == Schema Information
#
# Table name: tasks
#
#  id         :uuid             not null, primary key
#  content    :text
#  done       :boolean          default(FALSE), not null
#  due_date   :datetime
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Task < ApplicationRecord
  has_many :goal_task
  has_many :goals, through: :goal_task
end
