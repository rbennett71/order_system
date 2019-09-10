class OrdersController < ApplicationController
  before_action :set_order, only: [:show]
  skip_before_action :verify_authenticity_token

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.includes(order_items: [:product]).all #Eager load order items and products
  end

  def create
    order_item_params = (parms = order_params.dup).delete(:order_items)

    begin
      Order.transaction do
        @order = Order.create(parms)

        if @order.valid?
          order_item_params.each do |item|
            @order.order_items.create(item)
          end
        end
      end
    rescue ActiveRecord::RecordInvalid

    end

    respond_to do |format|
      if @order && @order.valid?
        format.json { render :show, status: :created, location: @order }
      else
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:customer_name, order_items:[:sku, :count])
  end
end
