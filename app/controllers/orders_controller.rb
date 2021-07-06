class OrdersController < ApplicationController

  def index
  end

  def create
    @purchase_buyer = PurchaseBuyers.new(purchase_params)
    if @purchase_buyer.valid?
      @purchase_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end

end
