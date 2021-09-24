class StoreReservation < ApplicationRecord
  belongs_to :user
  belongs_to :foodstall


  validates :visit_date_time, presence: true 
  validates :name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
end
