class CreateHabits < ActiveRecord::Migration[6.0]
  def change
    create_table :habits do |t|
      t.string :name
      t.text :details
      t.date :date_last_completed
      t.integer :current_streak, default: 0
      t.integer :longest_streak, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
