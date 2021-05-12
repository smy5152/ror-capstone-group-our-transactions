class AddAuthoridToTasks < ActiveRecord::Migration[6.1]
  def change
    add_reference :tasks, :author, null: false, foreign_key: {to_table: :users}, default: 1
  end
end
