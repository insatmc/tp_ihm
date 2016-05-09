json.array!(@domaines) do |domaine|
  json.extract! domaine, :id, :label
  json.url domaine_url(domaine, format: :json)
end
