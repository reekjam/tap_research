require 'rails_helper'

RSpec.describe CampaignQualification, type: :model do
  it { should belong_to :campaign_quota }
end
