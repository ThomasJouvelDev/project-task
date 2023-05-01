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
require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
