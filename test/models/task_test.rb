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
require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
