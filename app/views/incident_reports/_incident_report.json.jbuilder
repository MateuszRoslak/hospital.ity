json.extract! incident_report, :id, :title, :room, :description, :user_id, :created_at, :updated_at
json.url incident_report_url(incident_report, format: :json)
