class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:new, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :move_to_index2, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
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
  end
  
  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @item.destroy
  end
  #(任意実装メモ)@item.destroyが失敗した場合を考慮し、
   #else文を追記し、renderでshowアクションを呼び出してあげると良い
  
  private
  def item_params
    params.require(:item).permit(:title, :image, :text, :price, :category_id, :status_id, :shipping_fee_id, :shipping_date_id, :prefecture_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless current_user.id == @item.user.id    
  end
  
  def move_to_index2
    redirect_to root_path if @item.buy.present?
  end

end