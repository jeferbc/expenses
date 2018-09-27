class DashboardController < ApplicationController
  def index
    @tab = :dashboard
    @today = Expense.where(date_expense: Date.today).sum(:amount)
    @yesterday = Expense.where(date_expense: 1.days.ago).sum(:amount)
    @this_month = Expense.this_month.sum(:amount)
    @last_month = Expense.last_month.sum(:amount)
  end

  def last_six_months
    @expenses = Expense.six_month.group(:name)
    @purchases = Purchase.all
  end

  def by_day
    @expenses = Expense.where(date_expense: Date.today).group(:name)
    @purchases = Purchase.all
  end

  def by_category
    @expenses = Expense.all.group(:category_id)
  end

  def acum
    @expenses = Expense.all.group_by_month(:date_expense, last: 6)
  end

end
