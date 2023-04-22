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
  has_many :tasks, through: :goal_task
end
