json.extract! campaign, :id, :title, :body, :created_at, :updated_at
json.url campaign_url(campaign, format: :json)
