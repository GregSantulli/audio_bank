module Helpers

  def get_json(method, url, *params)
    send(method, url, *params)
    JSON.parse(response.body)
  end

end