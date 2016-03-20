json.array!(@baskets) do |basket|
  json.extract! basket, :id, :checkout_date
  json.url basket_url(basket, format: :json)
end
