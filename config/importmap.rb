# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "@rails/actioncable", to: "@rails--actioncable.js" # @7.0.8
pin "mapbox-gl" # @3.1.2
pin "process" # @2.0.1
# config/importmap.rb
pin "tom-select", to: "https://cdn.jsdelivr.net/npm/tom-select@2.0.0/dist/js/tom-select.complete.min.js"

pin "flatpickr" # @4.6.13
# pin "confirmDatePlugin", to: "https://cdn.skypack.dev/@flatpickr/confirm-date"
pin "star-rating.js" # @4.3.1
