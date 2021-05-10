class AddGroupidToTasks < ActiveRecord::Migration[6.1]
  def change
    add_reference :tasks, :group, foreign_key: { to_table: :groups }, default: :nil
  end
end
