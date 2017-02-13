module OrdersHelper
  def render_order_paid_state(order)
    if order.is_paid
      "Payed already"
    else
      "Not paid yet"
    end
  end
end
