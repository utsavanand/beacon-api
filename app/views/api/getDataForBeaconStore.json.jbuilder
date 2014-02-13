json.array! @note do |note|
  json.id note.id
  json.title note.title
  json.description note.description
  json.image note.image
  json.summary note.summary
end