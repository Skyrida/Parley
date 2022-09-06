import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
   static targets = ["descriptionContent", "descriptionOutput"]
  // static classes = [ "overLimit" ]
  // static values = {
   //  characterCount: Number,
  // }

  connect() {
    console.log("In the controller")
  }

  change() {
    const descriptionInputLength = this.descriptionContentTarget.value.length

    if (descriptionInputLength > 200) {
      this.descriptionOutputTarget.innerHTML = `${descriptionInputLength} characters: Too many!`
      this.descriptionOutputTarget.style.color = "red"
    } else {
      this.descriptionOutputTarget.innerHTML = `${descriptionInputLength} characters`
      this.descriptionOutputTarget.style.color = "lightgray"
    }
  }
}
