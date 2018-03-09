Rails.application.routes.draw do
  get 'campaigns/ordered_campaigns', to: 'campaign#ordered_campaigns'
end
