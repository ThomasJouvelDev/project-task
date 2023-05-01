# == Schema Information
#
# Table name: recurring_tasks
#
#  id         :uuid             not null, primary key
#  content    :text
#  name       :string           not null
#  recurrence :string           default("daily"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  goal_id    :uuid
#
class RecurringTask < ApplicationRecord
  belongs_to :goal, optional: true
  has_many :tasks, dependent: :destroy

  RECURRENCE_TYPE = [
    RECURRENCE_TYPE_DAILY = 'daily',
    RECURRENCE_TYPE_WEEKLY = 'weekly',
    RECURRENCE_TYPE_MONTHLY = 'monthly',
  ]

  validates :recurrence, inclusion: { in: RECURRENCE_TYPE }
end
