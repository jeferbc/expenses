require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase

  test "Expense should have a name, date_expense, category_id, purchase_id and amount" do
    @expense = Expense.new(name: 'prueba', date_expense: '2018-09-01')
    assert_not @expense.save
  end

  test "Expense amount should be numeric" do
    @expense = Expense.new(name: 'prueba', date_expense: '2018-09-01', category_id: 1, purchase_id: 1, amount: "hola")
    assert_not @expense.save
  end

end
