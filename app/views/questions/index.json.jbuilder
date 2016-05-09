json.array!(@questions) do |question|
  json.extract! question, :id, :content, :critere_id
  json.url question_url(question, format: :json)
end
