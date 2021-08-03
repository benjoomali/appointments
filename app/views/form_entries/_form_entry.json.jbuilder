json.extract! form_entry, :id, :name, :email, :phone, :form_id, :created_at, :updated_at
json.url form_entry_url(form_entry, format: :json)
