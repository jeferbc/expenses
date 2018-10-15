class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]

  def index
    @date = params[:month] ? @date = params[:month] : Date.today.strftime("%B %Y")
    @expenses = Expense.all.by_month(@date).order("date_expense DESC")
    @total = @expenses.get_sum
    @total_count = @expenses.get_count
    @average_expense = @total == 0 ? @average_expense = 0 : @average_expense = @expenses.average_expense.to_i
    @expenses = @expenses.where(purchase_id: params[:purchase_id]) if params[:purchase_id]
    @expenses = @expenses.where(category_id: params[:category_id]) if params[:category_id]
    @tab = :expenses
  end

  def new
    @expense = Expense.new
    @categories = Category.all
    @purchases = Purchase.all
  end

  def create
    @expense = Expense.create(expenses_params)

    respond_to do |format|
      if @expense.save
        @date = params[:month] ? @date = params[:month] : Date.today.strftime("%B %Y")
        @expenses = Expense.all.by_month(@date).order("date_expense DESC")
        @total = @expenses.get_sum
        @total_count = @expenses.get_count
        @average_expense = @expenses.average_expense.to_i
        format.json { head }
        format.js { flash[:notice] =  'Expense has been create successfully'}
      else
        format.json { render json: @expense.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @expense.update(expenses_params)
        @date = params[:month] ? @date = params[:month] : Date.today.strftime("%B %Y")
        @expenses = Expense.all.by_month(@date).order("date_expense DESC")
        @total = @expenses.get_sum
        @total_count = @expenses.get_count
        @average_expense = @expenses.average_expense.to_i
        format.json { head }
        format.js { flash[:notice] =  'Expense has been updated successfully'}
      else
        format.json { render json: @expense.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def destroy
        @expense.destroy
        @date = params[:month] ? @date = params[:month] : Date.today.strftime("%B %Y")
        @expenses = Expense.all.by_month(@date).order("date_expense DESC")
        @total = @expenses.get_sum
        @total_count = @expenses.get_count
        @average_expense = @expenses.average_expense.to_i
        respond_to do |format|
          format.json { head :no_content}
          format.js { flash[:notice] =  'Expense DELETE'}
        end
  end

  private
  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expenses_params
    params.require(:expense).permit(:name, :amount, :date_expense, :category_id, :purchase_id)
  end

end
