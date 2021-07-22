class FoodstallsController < ApplicationController
  before_action :search_foodstall, only: [:index, :search]
  def index
    @foodstalls = Foodstall.all
  end

  def new
    @foodstall = Foodstall.new
  end

  def create
      @foodstall = Foodstall.new(foodstall_params)
     if @foodstall.save
       redirect_to search_foodstalls_path
   else
     render :new
   end
 end

 def search
  @foodstalls = Foodstall.all
  @results = @q.result
 end

 def show
  @foodstall = Foodstall.find(params[:id])
  @date = Date.today
  @wdays = ['月','火','水','木','金','土','日']
 end


  private
  def foodstall_params
    params.require(:foodstall).permit(:category_id, :shop_name, :post_code, :city_name, :address, :phone_number, :building_name, :prefecture_id, :title, :text, images:[]).merge(owner_id: current_owner.id)
  end
  def search_foodstall
    @q = Foodstall.ransack(params[:q])  
  end
  def set_foodstall_column
    @foodstall_category_name = Foodstall.select("category").distinct
  end
  
end
