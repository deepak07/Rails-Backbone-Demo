json.array!(@tasks) do |task|
  json.extract! task, :id, :title, :description, :due_date, :status
  json.url task_url(task, format: :json)
end
