require 'rails_helper'

RSpec.describe CampaignQuota, type: :model do
  it { should belong_to :campaign }
  it { should have_many :campaign_qualifications }
end
