require_relative 'config/app'
require_relative "app/controllers/quotes_controller"
run Quotes::App.new
