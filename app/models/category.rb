class Category < ApplicationRecord
  has_many :expenses
  has_and_belongs_to_many :purchases
  validates :name, presence: true
end
