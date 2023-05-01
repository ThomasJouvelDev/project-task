class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks, id: :uuid do |t|
      t.uuid :recurring_task_id, null: true
      t.string :name, null: false
      t.text :content, null: true
      t.boolean :done, default: false, null: false
      t.datetime :due_date, null: true

      t.timestamps
    end
  end
end
