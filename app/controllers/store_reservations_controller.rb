class StoreReservationsController < ApplicationController
  def new
    @store_reservation = StoreReservation.new
  end
  def confirmation
    @prev_store_reservation = StoreReservation.new(store_reservations_params)
    @new_store_reservation = StoreReservation.new
  end

  def create
    @store_reservation = StoreReservation.new(store_reservations_params)

    @store_reservation.user_id = current_user.id
    @store_reservation.foodstall_id = params[:foodstall_id]
    if @store_reservation.save
      redirect_to foodstall_path(params[:foodstall_id])
    else
      render 'new'
    end
  end

  private
  def store_reservations_params
    params.require(:store_reservation).permit(:visit_date_time, :phone_number, :email, :name).merge(user_id: current_user.id, foodstall_id: params[:foodstall_id])
  end
end
