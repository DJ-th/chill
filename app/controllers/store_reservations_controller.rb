class StoreReservationsController < ApplicationController
  def index
    @store_reservations =StoreReservation.all
  end
  def new
    @store_reservation = StoreReservation.new
    @visit_date_time = VisitDateTime.find(params[:id])
  end
  def confirm
    @post = Post.new(post_params)
    render :new if @post.invalid?
  end
  def create
    store_reservation = StoreReservation.find(store_reservations_params)
  end

  private
  def store_reservations_params
    params.require(:store_reservation).permit(:visit_date_time, :phone_number, :email, :name).merge(user_id: current_user.id, foodstall_id: params[:foodstall_id])
  end
end
