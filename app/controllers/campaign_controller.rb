class CampaignController < ApplicationController
  def ordered_campaigns
    @campaigns = Campaign.all.order(:name)
    
    render json: @campaigns
  end
end
