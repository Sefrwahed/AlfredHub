json.array! @alfred_modules do |am|
  json.extract! am, :id, :name, :description, :license
  json.latest_version am.versions.last.number
end
