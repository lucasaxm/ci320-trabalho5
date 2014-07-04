json.array!(@moves) do |move|
  json.extract! move, :id, :name, :movetype, :category
  json.url move_url(move, format: :json)
end
