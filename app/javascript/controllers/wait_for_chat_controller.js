import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="wait-for-chat"
export default class extends Controller {
  static values = { debateId: Number }

  connect() {
    const url = `/debates/${this.debateIdValue}/search`
    
    this.interval = setInterval(()=> {

      fetch(url, {
        headers: { "Accept": "application/json" }
      })
      .then(response => response.json())
      .then((data) => {
        if (data.chat) {
          window.location.href = data.chat
        }
      })
    }, 2000)
  }

  disconnect() {
    clearInterval(this.interval)
  }
}
