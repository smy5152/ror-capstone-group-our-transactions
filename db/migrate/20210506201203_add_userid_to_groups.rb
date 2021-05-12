class AddUseridToGroups < ActiveRecord::Migration[6.1]
  def change
    add_reference :groups, :user, null: false, foreign_key: true, default: 1
  end
end
