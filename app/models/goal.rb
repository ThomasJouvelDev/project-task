# == Schema Information
#
# Table name: goals
#
#  id             :uuid             not null, primary key
#  classification :string           default("common"), not null
#  completion     :integer          default(0), not null
#  reward         :string
#  title          :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Goal < ApplicationRecord
  has_many :goal_task, dependent: :destroy
  has_many :tasks, through: :goal_task

  GOALS_CLASSIFICATIONS = [
    CLASSIFICATION_POOR = 'poor',
    CLASSIFICATION_COMMON = 'common',
    CLASSIFICATION_UNCOMMON = 'uncommon',
    CLASSIFICATION_RARE = 'rare',
    CLASSIFICATION_EPIC = 'epic',
    CLASSIFICATION_LEGENDARY = 'legendary',
  ]

  validates :classification, inclusion: { in: GOALS_CLASSIFICATIONS }

  def real_completion
    return completion unless tasks.present?

    total_tasks = tasks.size
    total_tasks_done = tasks.filter { |t| t.done? }.size
    ((total_tasks_done.to_f / total_tasks.to_f) * 100).to_i
  end
end
