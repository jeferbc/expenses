class DashboardController < ApplicationController
  def index
    @tab = :dashboard
    @today = Expense.where(date_expense: Date.today).sum(:amount)
    @yesterday = Expense.where(date_expense: 1.days.ago).sum(:amount)
    @this_month = Expense.this_month.sum(:amount)
    @last_month = Expense.last_month.sum(:amount)
  end
end
