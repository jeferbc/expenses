class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.string :name
      t.decimal :amount
      t.date :date_expense

      t.timestamps null: false
    end
  end
end
