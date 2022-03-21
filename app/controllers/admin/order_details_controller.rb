class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    @order = @order_detail.order
    if @order.order_details.all?{|o| o.making_status_before_type_cast == 3}
      @order.update(status: 3)
    elsif @order.order_details.where(making_status: 2..3).exists?
      @order.update(status: 2)
    end
    redirect_to admin_order_path(@order_detail.order)
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
