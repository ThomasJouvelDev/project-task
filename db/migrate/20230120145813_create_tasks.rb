class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :content
      t.boolean :done
      t.datetime :due_date

      t.timestamps
    end
  end
end
