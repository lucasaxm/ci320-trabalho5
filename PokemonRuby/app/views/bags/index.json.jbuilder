json.array!(@bags) do |bag|
  json.extract! bag, :id, :pokeballs, :potions, :trainer_id
  json.url bag_url(bag, format: :json)
end
