class BuyController < ApplicationController
  before_action :authenticate_user!,only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @buy_address = BuyAddress.new
  end
  
  def create
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid? 
      pay_item
      @buy_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def buy_params
    params.require(:buy_address).permit(:code, :prefecture_id, :city, :street, :building, :tel).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述
    Payjp::Charge.create(
      amount: @item[:price],  # 商品の値段
      card: buy_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end  

  def move_to_index
    redirect_to root_path if current_user.id == @item.user.id || @item.buy.present?
  end

end

# {"aa"=> "qq", "model"=>{"test"=>"ww"}}