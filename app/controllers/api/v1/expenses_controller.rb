module Api
    module V1
        class ExpensesController < ApplicationController
          def index
            @expenses = Expense.all.paginate(page: params[:page], per_page: 10)
            render json: @expenses
          end
        end
    end
end
