json.extract! order, :id, :city, :phone, :fullname, :created_at, :updated_at
json.url order_url(order, format: :json)