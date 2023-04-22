# == Schema Information
#
# Table name: tasks
#
#  id         :uuid             not null, primary key
#  content    :text
#  done       :boolean
#  due_date   :datetime
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Task < ApplicationRecord
  has_many :goals, through: :goal_task
end
