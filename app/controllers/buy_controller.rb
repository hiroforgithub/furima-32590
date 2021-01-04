class BuyController < ApplicationController
  def index
    @buy = Buy.new
  end

  def create
    @buy = Buy.new
  end
end
