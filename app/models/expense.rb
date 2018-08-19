class Expense < ApplicationRecord
  belongs_to :category
  belongs_to :purchase

  validates :name, :amount, :date_expense, presence: true



  by_star_field :date_expense

end
