json.array!(@style_interactions) do |style_interaction|
  json.extract! style_interaction, :id, :label
  json.url style_interaction_url(style_interaction, format: :json)
end
