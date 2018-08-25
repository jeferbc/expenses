class Expense < ApplicationRecord
  belongs_to :category
  belongs_to :purchase

  validates :name, :amount, :date_expense, presence: true
  validates :amount, presence: true, numericality: true, format: { :with => /\A\d{1,4}(\.\d{0,2})?\z/ }


  by_star_field :date_expense

  scope :this_month, -> { where(date_expense: Time.now.beginning_of_month..Time.now.end_of_month) }

  scope :last_month, -> { where(:date_expense => 1.month.ago.beginning_of_month..1.month.ago.end_of_month) }


end
