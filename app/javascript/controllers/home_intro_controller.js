import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="home-intro"
export default class extends Controller {
  static targets = ["intro", "logoSpan", "logoImage"]

  connect() {
    setTimeout(() => {
      this.introTarget.classList.add("bg-transparent")
    }, 3000);

    setTimeout(() => {
      this.logoImageTarget.classList.add("active")
    }, 200);

    this.logoSpanTargets.forEach((span, idx)=>{
      setTimeout(() => {
        span.classList.add('active');
      }, (idx + 1) * 400)
    });

    setTimeout(() => {
      this.logoImageTarget.classList.remove("active")
      this.logoImageTarget.classList.fade("active")
    }, 2100);

    setTimeout(() => {
      this.logoSpanTargets.forEach((span, idx)=>{
        setTimeout(() => {
          span.classList.remove('active');
          span.classList.add('fade');
        }, (idx + 1) * 200)
      });
    }, 2000);

    setTimeout(() => {
      this.introTarget.style.top = '-100vh';
    }, 2100);

    setTimeout(() => {

      this.introTarget.classList.add("d-none")
    }, 5000);
  }
}
