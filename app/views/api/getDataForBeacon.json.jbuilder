json.array! @item do |item|
  json.id item.id
  json.name item.name
  json.notes item.notes, :id, :title, :image, :description, :summary
end