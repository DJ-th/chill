class StoreReservation < ApplicationRecord
  belongs_to :user
  belongs_to :foodstall


  validates :visit_date_time, presence: true 
end
