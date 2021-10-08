class OwnersController < ApplicationController
  def show
    @owner = current_owner.name
    @foodstalls = Foodstall.all
    @store_reservations = StoreReservation.all
    @store_reservation = current_user.store_reservations
  end
end
