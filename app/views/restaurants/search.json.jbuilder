json.array!(@restaurants) do |restaurant|
  json.name restaurant.title
  json.location restaurant.location
  json.image restaurant.image
  # json.minprice        number_to_currency(book.price)
  # json.published_at book.published_at.strftime('%B %Y')
end
