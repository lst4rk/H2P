Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:4000'
    resource '/api/version1/asks', headers: :any,
             methods: [:get, :post, :patch, :put],
             credentials: true
  end
end