class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals, id: :uuid do |t|
      t.string :title
      t.string :reward
      t.integer :completion

      t.timestamps
    end
  end
end
