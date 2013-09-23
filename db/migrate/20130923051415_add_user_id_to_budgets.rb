class AddUserIdToBudgets < ActiveRecord::Migration
  def change
    add_column :budgets, :user_id, :integer, null: false
  end
end
