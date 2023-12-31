import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "list", "input"]

  connect() {
    console.log(this.formTarget)
    console.log(this.listTarget)
    console.log(this.inputTarget)
  }

  update() {
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`;
    console.log('Fetch URL:', url);
    fetch(url)
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        // Assuming that the data returned from the server is an array of excursions
        this.renderExcursions(data);
      });
  }

  search(event) {
    event.preventDefault();
    const url = this.formTarget.action;
    console.log('Fetch URL:', url);
    fetch(url, {
      method: "POST", // or "GET" based on your form configuration
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data);
        this.renderExcursions(data);
      });
  }
  renderExcursions(data) {
    this.listTarget.innerHTML = "";
    if (data.length > 0) {
      data.forEach((excursion) => {
        const imageTag = excursion.image_key
        ? `<img src="${cloudinaryImageUrl.replace('your_image_key', excursion.image_key)}" class="excursion-image" alt="Image of an Excursion">`
        : `<img src="https://source.unsplash.com/800x600/?excursion,${excursion.title.parameterize}" class="excursion-image" alt="Default Image">`;

        const excursionCard = `
          <a href="/excursions/${excursion.id}" class="excursion-link">
            <div class="excursion-card item">
              <h3 class="excursion-title card-title" style="height: 2.5rem; overflow: hidden;">${excursion.title}</h3>
              <div class="excursion-image">
                ${imageTag}
              </div>
              <div class="excursion-info">
                <p class="excursion-category"><strong>${excursion.category}</strong></p>
                <p>${excursion.description}</p>
                <p><i class="fa solid fa-location-dot"></i>     <i>${excursion.city}</i></p>
              </div>
            </div>
          </a>
        `;
        this.listTarget.insertAdjacentHTML("beforeend", excursionCard);
      });
    } else {
      this.listTarget.innerHTML = "<p>No excursions found.</p>";
    }
  }
}
