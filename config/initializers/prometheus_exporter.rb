unless Rails.env == "test"
  require 'prometheus_exporter/middleware'
  require 'prometheus_exporter/client'
  client = PrometheusExporter::Client.new(host: ENV.fetch('PROMETHEUS_EXPORTER_HOST'))
  PrometheusExporter::Client.default = client
  # This reports stats per request like HTTP status and timings
  Rails.application.middleware.unshift PrometheusExporter::Middleware
end
