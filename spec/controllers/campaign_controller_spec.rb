require 'rails_helper'

RSpec.describe CampaignController, type: :controller do
  it 'should list the campaigns in order of name ascending' do
    Campaign.create(name: 'Zebra')
    Campaign.create(name: 'Giraffe')
    Campaign.create(name: 'Alligator')

    get :ordered_campaigns
    ordered_campaigns = JSON.parse response.body

    expect(ordered_campaigns[0]['name']).to eq 'Alligator'
    expect(ordered_campaigns[1]['name']).to eq 'Giraffe'
    expect(ordered_campaigns[2]['name']).to eq 'Zebra'
  end
end
