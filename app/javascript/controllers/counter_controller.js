import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'count' ];

  connect() {
    setInterval(this.refresh, 5000);
  }

  refresh = () => {
    fetch('/recettes', { headers: { accept: "application/json" }})
      .then(response => response.json())
      .then((data) => {
        this.countTarget.innerText = `cette recette a ${data.reviews.count} commentaires`;
      });
  }
}
