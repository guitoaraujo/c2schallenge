json.extract! input, :id, :name, :phone, :message, :vehicle, :price, :link, :vehicle_brand, :vehicle_model, :km, :accessories, :created_at, :updated_at
json.url input_url(input, format: :json)
