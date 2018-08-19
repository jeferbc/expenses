class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
    @expenses = @expenses.where("category_id LIKE :category_id", category_id: "%#{params[:category_id]}%")
    @expenses = @expenses.where("purchase_id LIKE :purchase_id", purchase_id: "%#{params[:purchase_id]}%")
    @expenses = @expenses.by_month(params[:month])
  end

  def new
    @expense = Expense.new
    @categories = Category.all
    @purchases = Purchase.all
  end

  def create
    @expense = Expense.create(expense_params)
    if @expense.save
      redirect_to expenses_path
    else
      @errors = @expense.errors.full_messages
      render :new
    end
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    expense = Expense.find(params[:id])
    if expense.update(expense_params)
      redirect_to expenses_path
    else
      render :edit
    end
  end

  def destroy
    expense = Expense.find(params[:id])
    expense.destroy
    redirect_to expenses_path
  end

  private
  def expenses_params
    params.require(:expense).permit(:name, :amount, :category_id, :date_expense, :purchase_id)
  end

end
