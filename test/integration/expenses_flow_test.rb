require 'test_helper'

class ExpensesFlowTest < ActionDispatch::IntegrationTest

  setup do
    @expense = expenses(:one)
  end

  test "should create Expense" do
    get '/expenses'
    post_via_redirect '/expenses', params: { expense: { id: @expense.id, name: @expense.name, amount: @expense.amount, date_expense: @expense.date_expense, category_id: @expense.category_id, purchase_id: @expense.purchase_id }, format: :js}
    assert_equal 'Expense has been create successfully', flash[:notice]
  end

end
