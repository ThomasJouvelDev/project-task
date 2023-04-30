class CreateRecurringTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :recurring_tasks do |t|
      t.string :name, null: false
      t.string :recurrence, null: false, default: RecurringTask::RECURRENCE_TYPE_DAILY
      t.text :content, null: true
      t.uuid :goal_id, null: true

      t.timestamps
    end
  end
end
