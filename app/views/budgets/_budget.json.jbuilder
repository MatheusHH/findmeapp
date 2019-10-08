json.extract! budget, :id, :customer_id, :duedate, :totalprice, :discount, :created_at, :updated_at
json.url budget_url(budget, format: :json)
