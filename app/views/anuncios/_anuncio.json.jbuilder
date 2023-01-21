json.extract! anuncio, :id, :title, :description, :categoria, :remitente, :created_at, :updated_at
json.url anuncio_url(anuncio, format: :json)
