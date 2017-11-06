json.extract! commission, :id, :user_id, :title, :description, :price, :created_at, :updated_at
json.url commission_url(commission, format: :json)
