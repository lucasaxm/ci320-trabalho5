json.array!(@trainers) do |trainer|
  json.extract! trainer, :id, :name, :city, :badges
  json.url trainer_url(trainer, format: :json)
end
