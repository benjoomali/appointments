json.extract! form, :id, :name, :description, :user_id, :created_at, :updated_at
json.url form_url(form, format: :json)
