class Review < ApplicationRecord
  belongs_to :list

  validates :content, presence: true
  validates :rating, presence: true, inclusion: { in: 0..5, message: "must be between 0 and 5" }
end
