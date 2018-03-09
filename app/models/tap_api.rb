require 'base64'
require 'rest-client'

class TapAPI
  attr_reader :auth

  def initialize email, api_token
    @auth = Base64::strict_encode64("#{email}:#{api_token}")
    @headers = {
      "Authorization" => "Basic #{@auth}",
      "Content-Type" => "application/json"
    }
  end

  def fetch_campaigns
    url = "https://staging.tapresearch.com/api/v1/campaigns"
    JSON.parse RestClient.get(url, headers=@headers)
  end

  def fetch_campaign_by_id id
    url = "https://staging.tapresearch.com/api/v1/campaigns/#{id}"
    JSON.parse RestClient.get(url, headers=@headers)
  end
end
