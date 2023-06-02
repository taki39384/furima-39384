class OrdersController < ApplicationController
  def index
    @order_information = OrderInformation.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_information = OrderInformation.new(order_information_params)
    if @order_information.valid?
      @order_information.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_information_params
    params.require(:order_information).permit(:post_code, :region_of_origin_id, :municipalities, :address, :building_name, :number, :order).merge(user_id: current_user.id, item_id: @item.id)
  end
end
