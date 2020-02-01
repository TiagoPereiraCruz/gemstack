require "httparty"

class SpotApi
  include HTTParty
  base_uri "http://spotlab-api.herokuapp.com"

  def session(payload)
    self.class.post(
      "/sessions",
      body: payload.to_json,
      headers: { "content-type": "application/json" },
    )
  end
end
