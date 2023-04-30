class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals, id: :uuid do |t|
      t.string :title, null: false
      t.string :reward, null: true
      t.string :classification, default: Goal::CLASSIFICATION_COMMON, null: false
      t.integer :completion, default: 0 , null: false

      t.timestamps
    end
  end
end
