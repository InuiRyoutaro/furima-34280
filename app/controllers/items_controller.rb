class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :abc, only: [:show, :edit, :update]
  before_action :ensure_current_user, only: [:edit, :update]


  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show  
    #@item = Item.find(params[:id])
  end

  def edit  
    #@item = Item.find(params[:id])
    #unless current_user == @item.user
      #redirect_to root_path
    #end
  end

  def update  
    #@item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :price, :prefecture_id, :category_id, :description, :item_condition_id, :shipping_cost_id, :shipping_day_id,:user_id,).merge(user_id: current_user.id)
  end

  def abc
    @item = Item.find(params[:id])
  end

  def ensure_current_user  
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

end
