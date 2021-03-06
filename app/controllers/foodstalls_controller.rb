class FoodstallsController < ApplicationController
  before_action :authenticate_owner!, only: [:new]
  before_action :search_foodstall, only: [:index, :search]
  def index
    @foodstalls = Foodstall.all
     set_foodstall_column
    @results = @p.result
    @prefecture = Prefecture.where(params[:id])
    @category = Category.where(params[:id])
    @comment = Comment.all
    @all_ranks = Comment.where(foodstall_id: @foodstalls.ids, raty: @comment.ids).order('raty desc').limit(3)
  end

  def new
    @foodstall = Foodstall.new
  end

  def create
      @foodstall = Foodstall.new(foodstall_params)
      @comment = Comment.new
  if @foodstall.save
    redirect_to foodstalls_path(:foodstall_id)
else
  render :new
  end
 end

 def search
  @foodstalls = Foodstall.all
  @results = @p.result
  @category = Category.where(params[:id])
  @prefecture = Prefecture.where(params[:id])
  @comments = Comment.where(foodstall_id: @foodstalls.ids)
 end

 def show
  @foodstall = Foodstall.find(params[:id])
  @date = Date.today
  @wdays = ['月','火','水','木','金','土','日']
  #@comments = @foodstall.comments
  @comments = Comment.where(foodstall_id: @foodstall.id)
 end

  private
  def foodstall_params
    params.require(:foodstall).permit(:category_id, :shop_name, :post_code, :city_name, :address, :phone_number, :building_name, :prefecture_id, :title, :text, images: []).merge(owner_id: current_owner.id)
  end
  def set_q
    @p = Foodstall.ransack(params[:q])
  end

  def search_foodstall
    @p = Foodstall.ransack(params[:q])  
  end
  def set_foodstall_column
    @foodstall_category_name = Foodstall.select("category").distinct
    @foodstall_prefecture_name = Foodstall.select("prefecture").distinct
  end
  
end
