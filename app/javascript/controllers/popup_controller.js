import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="popup"

export default class extends Controller {
  static targets = ["createForm"]

  connect() {
    console.log("Whatever");
  }

  showform() {
    this.createFormTarget.classList.remove("d-none");
  }

  closeform() {
    this.createFormTarget.classList.add("d-none");
  }
}
