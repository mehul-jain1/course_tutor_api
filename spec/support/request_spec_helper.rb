module RequestSpecHelper
  def json
    JSON.parse(response.body)
  end

  def headers
    {
      'Content-Type' => 'application/json',
      'Authorization' => 'Bearer my_token'
    }
  end
end