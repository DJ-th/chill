class UsersController < ApplicationController
  def show
    @name = current_user.name
    @store_reservations = StoreReservation.all
    @store_reservation = current_user.store_reservations
  end
end
