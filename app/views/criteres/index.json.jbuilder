
json.array!(@criteres) do |critere|
  json.label critere.label
  json.catagorie Catagorie.find(critere.catogrie_id).label
  json.auteur Auteur.find(critere.auteur_id).nom
  json.description critere.description
  json.questions do
    json.array!(critere.questions) do |question|
      json.content question.content
    end
  end
  json.plateforms do
    json.array!(critere.plateforms) do |plateform|
      json.label plateform.label
    end
  end
  json.domaines do
    json.array!(critere.domaines) do |domaine|
      json.label domaine.label
    end
  end
  json.style_interactions do
    json.array!(critere.style_interactions) do |style_interaction|
      json.label style_interaction.label
    end
  end
end

