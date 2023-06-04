class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :item, only: [:index, :create]

  def index
    @order_information = OrderInformation.new
    if current_user == @item.user || @item.order.present?
      redirect_to root_path
    end
  end

  def create
    @order_information = OrderInformation.new(order_information_params)
    if @order_information.valid?
      pay_item
      @order_information.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_information_params
    params.require(:order_information).permit(:post_code, :region_of_origin_id, :municipalities, :address, :building_name, :number, :order).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
      Payjp::Charge.create(
        amount: @item[:price],
        card: order_information_params[:token],
        currency: 'jpy'
      )
  end

  def item
    @item = Item.find(params[:item_id])
  end
end
