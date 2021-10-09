class Comment < ApplicationRecord
  belongs_to :foodstall
  belongs_to :user

  validates :text, presence: true 
  validates :raty, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true
end
