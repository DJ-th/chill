class StoreReservation < ApplicationRecord
  belongs_to :user
  belongs_to :foodstall


<<<<<<< Updated upstream
  validate :visit_date_time
  validates :phone_number, presence: true
  validates :name, presence: true
  validates :email, presence: true
=======
  validates :visit_date_time, presence: true 
  validates :name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
>>>>>>> Stashed changes
end
