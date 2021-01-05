class BuyController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    binding.pry
    @buy = Buy.new(buy_params)
  end

  private
  def  buy_params
    params.require(:buy, :address).permit(:code, :prefecture_id, :city, :street, :building, :tel).merge(user_id:, buy_id:)
  end
end
