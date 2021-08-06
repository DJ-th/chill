class Comment < ApplicationRecord
  belongs_to :foodstall
  belongs_to :user

  validates :title, presence: true
  validates :text, presence: true
end
