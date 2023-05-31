class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  end
  
  def show
    @item = Item.find(params[:id])
  end


  private
  def item_params
    params.require(:item).permit(:itemimage, :name, :explanation, :category_id, :situation_id, :delivery_charge_id, :region_of_origin_id, :day_to_ship_id, :price).merge(user_id: current_user.id)
  end

end
