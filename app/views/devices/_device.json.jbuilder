json.extract! device, :id, :name, :model, :manufacturer, :device_type, :room_id, :created_at, :updated_at
json.url device_url(device, format: :json)
