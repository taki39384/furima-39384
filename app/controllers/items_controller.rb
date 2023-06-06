class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :move_to_index, only: [:destroy, :edit, :update]
  before_action :url, only: [:edit, :update, :destroy]
  
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

  def edit
  end

  def update
    if @item.update(item_params)
    redirect_to item_path
    else 
      render :edit
    end
  end
  
  def show
  end
  
  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end


  private
  def item_params
    params.require(:item).permit(:itemimage, :name, :explanation, :category_id, :situation_id, :delivery_charge_id, :region_of_origin_id, :day_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless current_user && current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def url
    if @item.user_id != current_user.id || @item.order != nil
      redirect_to root_path
    end
  end
end
