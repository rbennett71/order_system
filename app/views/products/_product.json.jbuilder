json.extract! product, :id, :name, :sku, :count, :description, :supplier_id, :price, :created_at, :updated_at
json.url product_url(product, format: :json)
