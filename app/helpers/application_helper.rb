module ApplicationHelper
  def host
    request.protocol + request.host_with_port
  end
end
