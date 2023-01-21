json.extract! horario, :id, :title, :categoria, :start_time, :end_time, :created_at, :updated_at
json.url horario_url(horario, format: :json)
