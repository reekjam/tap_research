class CreateCampaignQuota < ActiveRecord::Migration[5.1]
  def change
    create_table :campaign_quota do |t|
      t.references :campaign, foreign_key: true

      t.timestamps
    end
  end
end
