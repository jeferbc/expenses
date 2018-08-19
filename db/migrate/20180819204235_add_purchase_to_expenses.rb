class AddPurchaseToExpenses < ActiveRecord::Migration[5.0]
  def change
    add_reference :expenses, :purchase, foreign_key: true
  end
end
