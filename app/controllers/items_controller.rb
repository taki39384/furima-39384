class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
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


  private
  def item_params
    params.require(:item).permit(:itemimage, :name, :explanation, :category_id, :situation_id, :delivery_charge_id, :region_of_origin_id, :day_to_ship_id, :price, :user).merge(user_id: current_user.id)
  end

end
