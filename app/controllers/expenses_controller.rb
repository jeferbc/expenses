class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]

  def index
    @tab = :expenses
    if params[:category_id]
      @expenses = Expense.where("category_id LIKE :category_id", category_id: "%#{params[:category_id]}%")
    elsif params[:purchase_id]
      @expenses = Expense.where("purchase_id LIKE :purchase_id", purchase_id: "%#{params[:purchase_id]}%")
    elsif params[:month]
      @expenses = Expense.all.by_month(params[:month])
    else
      @expenses = Expense.all.by_month(Date.today)
    end
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
        format.json { head :no_content}
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
        format.json { head }
        format.js { flash[:notice] =  'Expense has been updated successfully'}
      else
        format.json { render json: @expense.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @expense = Expense.find(params[:id])

    respond_to do |format|
      if @expense.destroy
        format.json { head :no_content }
        format.js { flash[:notice] =  'Expense DELETE'}
      else
        format.json { render json: @expense.errors.full_messages, status: :unprocessable_entity }
      end
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
