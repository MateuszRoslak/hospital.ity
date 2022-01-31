json.extract! cleaning_report, :id, :title, :description, :user_id, :created_at, :updated_at
json.url cleaning_report_url(cleaning_report, format: :json)
