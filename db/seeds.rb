EMAIL = 'codetest@tap.com'
API_TOKEN = '1c7dd6fd2a94b2e6431b367189aead01'

connection = TapAPI.new EMAIL, API_TOKEN
campaigns = connection.fetch_campaigns

campaigns.each do |c|
  campaign = Campaign.create(
    id: c['id'],
    length_of_interview: c['length_of_interview'],
    cpi: c['cpi'],
    name: c['name']
  )
  puts "Campaign created: #{campaign.id}"

  if campaign
    campaign_quotas = connection.fetch_campaign_by_id(campaign.id)['campaign_quotas']
    campaign_quotas.each do |quota|

      campaign_quota = campaign.campaign_quotas.create(
        id: quota['id'],
      )
      puts "Campaign quota created: #{campaign_quota.id}"

      if campaign_quota
        quota['campaign_qualifications'].each do |qualification|
          campaign_qualification = campaign_quota.campaign_qualifications.create(
            pre_codes: qualification['pre_codes'].join(','),
            question_id: qualification['question_id']
          )
          puts "Campaign qualification created: #{campaign_qualification.id}"
        end
      end

    end
  end
end
