import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="tom-select"
export default class extends Controller {
  // static values = { options: Object }

  connect() {
      console.log('DEBUGGING GHOST!!!')
      new TomSelect(
      this.element
      // this.optionsValue
    );
  }
}
