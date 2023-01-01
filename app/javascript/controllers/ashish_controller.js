import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="ashish"
export default class extends Controller {
  static targets = ["output"];
  static values = { number: Number };

  connect() {
    this.numberValueChanged();
    console.log("Hello from ashish..");
  }

  increment() {
    this.numberValue++;
  }

  // callback function after incrementing the number value.
  numberValueChanged() {
    this.outputTarget.textContent = this.numberValue;
  }
}
