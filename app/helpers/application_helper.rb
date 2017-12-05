module ApplicationHelper
  def host
    request.protocol + request.host_with_port
  end

  def payment_method(payment)
    "#{payment.payment_method.card_type} - #{payment.payment_method.last_four_digits}"
  end
end
