import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["slide"];
  static values = { index: Number };

  initialize() {
    this.showCurrentSlide();
  }

  next() {
    this.indexValue++;
    if (this.indexValue >= 4) {
      this.indexValue = 0;
    }
    this.showCurrentSlide();
  }

  previous() {
    this.indexValue--;
    if (this.indexValue < 0) {
      this.indexValue = 3;
    }
    this.showCurrentSlide();
  }

  showCurrentSlide() {
    this.slideTargets.forEach((element, index) => {
      element.hidden = index != this.indexValue;
    });
  }
}
