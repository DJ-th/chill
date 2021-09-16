class StoreReservationsController < ApplicationController
  def index
    @store_reservations =StoreReservation.all
  end
  def new
    @store_reservation = StoreReservation.new
    #@visit_date_time = Visit_Date_Time.find(params[:id])
  end
  def confirmation
    @store_reservation = StoreReservation.new(store_reservation_params)
    render :new if @store_reservation.invalid?
  end
  def create
    @store_reservation = StoreReservation.new(store_reservations_params)
   
    if @store_reservation.save
      render 'edit'
    else
      render 'new'
    end
  end

  private
  def store_reservations_params
    params.require(:store_reservation).permit(:visit_date_time, :phone_number, :email, :name).merge(user_id: current_user.id, foodstall_id: params[:foodstall_id])
  end
end
