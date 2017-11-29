module ApplicationHelper
  def host
    request.protocol + request.host_with_port
  end

  def line_item_type(li)
    li.coupon_id ? 'Coupon' : 'Offer'
  end
end
