json.array!(@migrations) do |migration|
  json.extract! migration, :id, :name, :timestamp, :content, :envs
  json.url migration_url(migration, format: :json)
end
