json.array!(@items) do |item|
  json.extract! item, :id, :barcode, :name, :category, :price
  json.url item_url(item, format: :json)
end
