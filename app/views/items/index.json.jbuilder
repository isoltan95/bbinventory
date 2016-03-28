json.array!(@items) do |item|
  json.extract! item, :id, :barcode, :quantity, :name, :gender, :age, :type, :notes, :category_id
  json.url item_url(item, format: :json)
end
