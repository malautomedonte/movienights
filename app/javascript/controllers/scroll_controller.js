import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll"
export default class extends Controller {
  static targets = ["event-card"]


  connect() {
  }

  scrollLeft() {
    console.log("scrolling left")
    this.element.scrollBy({ left: -300, behavior: 'smooth' })
  }

  scrollRight() {
    this.element.scrollBy({ left: 300, behavior: 'smooth' })
  }
}
