json.array!(@plateforms) do |plateform|
  json.extract! plateform, :id, :label
  json.url plateform_url(plateform, format: :json)
end
