class CreateGoalTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :goal_tasks, id: :uuid do |t|
      t.references :goal, null: false, foreign_key: true, type: :uuid
      t.references :task, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
