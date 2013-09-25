json.array!(@orders) do |order|
  json.extract! order, :email, :exchange_rate, :fare, :fee, :product, :description, :count, :spot, :japanprice, :taiwanprice, :totalprice, :bank_name, :bank_account
  json.url order_url(order, format: :json)
end
