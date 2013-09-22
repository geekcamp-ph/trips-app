class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.decimal :budget, :decimal, precision: 10, scale: 2, default: 0.00
      t.datetime :date_from, null: false
      t.datetime :date_to, null: false
    end
  end
end
