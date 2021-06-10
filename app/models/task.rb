class Task < ApplicationRecord
  validates :body, presence: true, length: {maximum: 50}

  belongs_to :category
end
