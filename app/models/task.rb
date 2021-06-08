class Task < ApplicationRecord
  validates :description, presence: true, length: {maximum: 50}

  belongs_to :category
end
