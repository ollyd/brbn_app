json.array!(@bourbons) do |bourbon|
  json.extract! bourbon, :id, :name, :alcohol, :image, :description, :toffee, :woody, :tannic, :char, :sweet, :grainy, :vanilla, :corny, :buttery, :heat, :dark_fruit, :citrus_fruit, :floral, :spicy, :herbal, :malty
  json.url bourbon_url(bourbon, format: :json)
end
