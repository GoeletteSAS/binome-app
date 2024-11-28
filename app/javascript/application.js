// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"
import SearchAutoFillController from "./controllers/search_auto_fill_controller.js"
Stimulus.register("search-auto-fill", SearchAutoFillController)
