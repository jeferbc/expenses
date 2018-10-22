class DashboardController < ApplicationController
  def index
    @tab = :dashboard
    @today = Expense.where(date_expense: Date.today).sum(:amount)
    @yesterday = Expense.where(date_expense: 1.days.ago).sum(:amount)
    @this_month = Expense.this_month.sum(:amount)
    @last_month = Expense.last_month.sum(:amount)
  end

  def last_six_months
    @expenses = Expense.six_month.select(:purchase_id, :id).group( :purchase_id, :id)
  end

  def by_day
    @expenses = Expense.where(date_expense: Date.today).select(:purchase_id, :id, :amount).group(:purchase_id, :id, :amount)
  end

  def by_category
    @expenses = Expense.all.select(:category_id).group(:category_id)
  end

  def acum
    @expenses = Expense.all.select(:date_expense, :amount).group(:date_expense, :amount).group_by_month(:date_expense, last: 2)
  end

end
