import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
   static targets = ["titleContent", "titleOutput", "descriptionContent", "descriptionOutput"]
  // static classes = [ "overLimit" ]
  // static values = {
   //  characterCount: Number,
  // }

  connect() {
    console.log("In the controller")
  }

  change() {
    const titleInputLength = this.titleContentTarget.value.length

    if (titleInputLength > 100) {
      this.titleOutputTarget.innerHTML = `${titleInputLength} characters / 100: Too many!`
      this.titleOutputTarget.style.color = "red"
    } else {
      this.titleOutputTarget.innerHTML = `${titleInputLength} characters / 100`
      this.titleOutputTarget.style.color = "#81878C"
    }

    const descriptionInputLength = this.descriptionContentTarget.value.length

    if (descriptionInputLength > 200) {
      this.descriptionOutputTarget.innerHTML = `${descriptionInputLength} characters / 200: Too many!`
      this.descriptionOutputTarget.style.color = "red"
    } else {
      this.descriptionOutputTarget.innerHTML = `${descriptionInputLength} characters / 200`
      this.descriptionOutputTarget.style.color = "#81878C"
    }
  }
}
