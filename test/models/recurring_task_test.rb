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
require "test_helper"

class RecurringTaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
