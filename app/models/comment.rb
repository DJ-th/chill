class Comment < ApplicationRecord
  belongs_to :foodstall
  belongs_to :user

  validates :text, presence: true 
  validates :user_id, presence: true 
  validates :foodstall_id, presence: true 
end
