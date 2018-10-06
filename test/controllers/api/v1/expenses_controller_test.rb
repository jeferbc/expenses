require 'test_helper'

    module V1
        class ExpensesControllerTest < ActionDispatch::IntegrationTest

          setup do
            @expense = expenses(:one)

            @header = {
              'X-Epense-id': @expense.id,
              'X-Epense-name': @expense.name,
              'X-Epense-amount': @expense.amount,
              'X-Epense-date_expense': @expense.date_expense,
              'X-Epense-category_id': @expense.category_id,
              'X-Epense-purchase_id': @expense.purchase_id,
            }
          end

          test "create expense" do
            expense_params = {
              id: @expense.id,
              name: @expense.name,
              amount: @expense.amount,
              date_expense: @expense.date_expense,
              category_id: @expense.category_id,
              purchase_id: @expense.purchase_id,
            }

            post expenses_path, headers: @header, params: { expense: expense_params, format: :json}
            assert_response :success
          end

        end
    end
