json.extract! task, :id, :name, :amount, :group_id, :author_id, :created_at, :updated_at
json.url task_url(task, format: :json)
