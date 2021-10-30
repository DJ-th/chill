class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def show
     if user_signed_in? 
    @store_reservations = StoreReservation.where(user_id: current_user.id)
     else
      redirect_to root_path
     end
  end
end
