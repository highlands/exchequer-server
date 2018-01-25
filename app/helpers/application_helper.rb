module ApplicationHelper
  def host
    request.protocol + request.host_with_port
  end

  def format_amount(amount)
    format('%.2f', amount)
  end
end
