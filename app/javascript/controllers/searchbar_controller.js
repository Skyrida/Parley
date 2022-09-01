import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="searchbar"
export default class extends Controller {

  static targets = [ "searchbarform", "debatesCards", "formQuery"]

  appear() {
    this.searchbarformTarget.classList.toggle("d-none")
  }

  searchFunction(event) {
      console.log("in search")
      const url = `${this.formQueryTarget.action}?title=${event.target.value}`
      event.preventDefault()
      fetch(url, {
        headers: { "Accept": "application/json" },
      })
        .then(response => response.json())
        .then((data) => {
          this.debatesCardsTarget.outerHTML = (data.debates)
        })
    // input = debate.getElementById('searchquery');


    // // Loop through all list items, and hide those who don't match the search query
    // for (i = 0; i < li.length; i++) {
    //   a = li[i].getElementsByTitle("a")[0];
    //   txtValue = a.textContent || a.innerText;
    //   if (txtValue.toUpperCase().indexOf(filter) > -1) {
    //     li[i].style.display = "";
    //   }

    //   else {
    //     li[i].style.display = "none";
    //   }
  }
}

//<script>

// </script>
