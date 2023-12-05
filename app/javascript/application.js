// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"
import SearchExcursionsController from "./controllers/search_excursions_controller.js"
Stimulus.register("search-excursions", SearchExcursionsController)
