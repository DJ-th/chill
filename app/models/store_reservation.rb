class StoreReservation < ApplicationRecord
  belongs_to :user
  belongs_to :foodstall


  validate :visit_date_time
  validates :phone_number, presence: true
  validates :name, presence: true
  validates :email, presence: true
end
