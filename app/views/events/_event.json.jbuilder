json.extract! event, :id, :name, :startDate, :endDate, :eventPlace, :created_at, :updated_at
json.url event_url(event, format: :json)
