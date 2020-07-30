class AddTotalToHabits < ActiveRecord::Migration[6.0]
  def change
    add_column :habits, :total, :integer, default: 0
  end
end
