class BuyController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @buy_address = BuyAddress.new
  end
  
  def create
    @item = Item.find(params[:item_id])
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid? 
      @buy_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def buy_params
    params.permit(:code, :prefecture_id, :city, :street, :building, :tel, :item_id).merge(user_id: current_user.id)
  end

end

# {"aa"=> "qq", "model"=>{"test"=>"ww"}}