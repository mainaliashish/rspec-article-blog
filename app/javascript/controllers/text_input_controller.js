import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="ashish"
export default class extends Controller {
  static targets = ["input", "output"];
  connect() {
    console.log("Hello from Text_input..");
  }

  changed() {
    this.outputTarget.textContent = this.inputTarget.value;
  }
}
