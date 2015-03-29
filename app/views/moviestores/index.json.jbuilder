json.array!(@moviestores) do |moviestore|
  json.extract! moviestore, :id, :title, :genre, :stock, :release_date, :currently_rented_out
  json.url moviestore_url(moviestore, format: :json)
end
