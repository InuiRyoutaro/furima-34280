class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item 
  before_action :move_to_index, only: [:index]

 

  def index
    @purchase_buyer = PurchaseBuyer.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_buyer = PurchaseBuyer.new(buyers_params)
    if @purchase_buyer.valid?
      pay_item
      @purchase_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyers_params
    params.require(:purchase_buyer).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buyers_params[:token], 
      currency: 'jpy'
    )
  end

  private
  
  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if item.purchase.present? || current_user == @item.user
      redirect_to root_path
    end
  end


end
