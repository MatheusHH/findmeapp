json.extract! book, :id, :description, :status, :user_id, :customer_id, :created_at, :updated_at
json.url book_url(book, format: :json)
