class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @purchase_buyer = PurchaseBuyer.new
    @item = Item.find(params[:item_id])
  end

  # def new
  #   @purchase_buyer = PurchaseBuyers.new
  # end


  def create
    @item = Item.find(params[:item_id])
    @purchase_buyer = PurchaseBuyer.new(buyers_params)
    # binding.pry
    if @purchase_buyer.valid?
      @purchase_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyers_params
    params.require(:purchase_buyer).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
    # params.require(:donation_address).permit(:postal_code, :prefecture, :city, :house_number, :building_name, :price).merge(user_id: current_user.id)
  end


end
