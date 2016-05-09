json.array!(@catagories) do |catagory|
  json.extract! catagory, :id, :label, :catogorie_id
  json.url catagory_url(catagory, format: :json)
end
