json.extract! task, :id, :name, :amount, :created_at, :updated_at
json.url task_url(task, format: :json)
