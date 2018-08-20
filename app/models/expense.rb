class Expense < ApplicationRecord
  belongs_to :category
  belongs_to :purchase

  validates :name, :amount, :date_expense, presence: true
  validates :amount, presence: true, numericality: true, format: { :with => /\A\d{1,4}(\.\d{0,2})?\z/ }


  by_star_field :date_expense

end
