class Purchase < ApplicationRecord
  has_many :expenses
  has_and_belongs_to_many :categories

  validates :name_purchases, presence: true
end
