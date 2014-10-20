json.array!(@albums) do |album|
  json.extract! album, :id, :album_name, :artist_id, :year
  json.url album_url(album, format: :json)
end
