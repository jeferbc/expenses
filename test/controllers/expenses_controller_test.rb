require 'test_helper'

class ExpensesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @expense = expenses(:one)
  end

  test "should get Index" do
    get '/expenses'
    assert_response :success
    assert_not_nil assigns(:expenses)
  end

  test "should delete Expense" do
    assert_difference('Expense.count', -1) do
      delete expense_url(@expense), format: :js
    end
    assert_equal 'Expense DELETE', flash[:notice]
  end

end
