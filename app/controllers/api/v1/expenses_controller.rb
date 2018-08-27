module Api
    module V1
        class ExpensesController < ApplicationController

          before_action :set_expense, only: [:show, :edit, :update, :destroy]
          skip_before_action :verify_authenticity_token

          def index
            @expenses = Expense.all.paginate(page: params[:page], per_page: 10)
            render json: @expenses
          end

          def new
            @expense = Expense.new
          end

          def create
            @expense = Expense.new(expenses_params)
            if @expense.save
              render json: @expense, status: 201
            else
              render json: { errors: @expense.errors }, status: 422
            end
          end

          def update
            if @expense.update(expenses_params)
              render json: @expense, status: 200
            else
              resder json: { errors: @expense.erros }, status: 422
            end 
          end

          def expenses_params
            params.require(:expense).permit(:name, :amount, :date_expense, :category_id, :purchase_id)
          end

          def set_expense
            @expense = Expense.find(params[:id])
          end

        end
    end
end
