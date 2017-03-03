json.extract! event, :id, :name, :body, :due_date, :completed, :created_at, :updated_at
json.url event_url(event, format: :json)
