class Foodstall < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
   belongs_to :owner
   belongs_to_active_hash :category
   belongs_to_active_hash :prefecture
   has_many_attached :images
   has_many :store_reservations
   has_many :comments
  
   
  with_options presence: true do
    validates :title
    validates :images
    validates :shop_name
    validates :text
    validates :city_name
    validates :address
    validates :building_name
    with_options format: { with: /\A\d{3}[-]\d{4}\z/} do
    validates :post_code
    end
    with_options format: { with: /\A\d{10,11}\z/} do
    validates :phone_number
    end
    validates :category_id
    validates :prefecture_id
   end
   def avg_raty
    unless self.comments.empty?
      comments.average(:raty).round(1).to_f
    else
      0.0
    end
  end
  def avg_raty_percentage
    unless self.comments.empty?
      comments.average(:raty).round(1).to_f*100/5
    else
      0.0
    end
  end

end
