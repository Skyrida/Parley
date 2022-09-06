import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="topicbanner"
export default class extends Controller {

  static targets = [ "movingArrow", "topics", "mainBanner", "mainHeader", "secondHeader"]

  connect() {
  }

  appear() {
    this.mainBannerTarget.classList.toggle("main-banner-home-height");
    this.mainHeaderTarget.classList.toggle("d-none");
    this.secondHeaderTarget.classList.toggle("banner-show");
    this.topicsTarget.classList.toggle("banner-show");
    this.movingArrowTarget.classList.toggle("banner-arrow-rotate")
  }
}
