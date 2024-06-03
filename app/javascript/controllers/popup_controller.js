import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="popup"

export default class extends Controller {
  static targets = ["modal"]
  
  connect() {
  }
}
