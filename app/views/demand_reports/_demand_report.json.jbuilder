json.extract! demand_report, :id, :title, :description, :user_id, :created_at, :updated_at
json.url demand_report_url(demand_report, format: :json)
