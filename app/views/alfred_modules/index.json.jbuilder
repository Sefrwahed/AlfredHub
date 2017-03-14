json.array! @alfred_modules do |am|
  json.extract! am, :id, :name, :description, :license

  json.user do
    json.id am.user.id
    json.username am.user.username
  end

  json.latest_version do
    json.number am.versions.last.number
    json.id am.versions.last.id
  end
end
