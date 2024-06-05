import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="changebutton"
export default class extends Controller {
  static targets = ["button", "buttonjoin"]

  connect() {
    console.log("It works...")
  }

  assist(event) {

    event.preventDefault()
    const eventId = this.buttonjoinTarget.id;
    const url = `/event_users?event_id=${eventId}`;
    fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
      },
      body: JSON.stringify({ event_id: eventId })
    })
    .then(response => {
      if (response.ok) {
        return response.json();
      } else {
        throw new Error('Network response was not ok.');
      }
    })
    .then(data => {
      console.log(data.event_user["id"]);
      const EventUserId = data.event_user["id"];
      if (data.success) {
    // console.log(this.buttonjoinTarget);
    this.buttonjoinTarget.classList.remove("bookmark-type");
    this.buttonjoinTarget.classList.add("bookmark-type-attended");
    this.buttonjoinTarget.innerHTML = `<i class="fa-solid fa-minus"></i>`;
    this.buttonjoinTarget.setAttribute("data-action", "click->changebutton#deassist");
    this.buttonjoinTarget.setAttribute("id", `${EventUserId} ${eventId}`);
    this.buttonjoinTarget.setAttribute("data-changebutton-target", "button");
  }
  else {
    // Handle error
    console.error('Error:', data.message);
  }
})
.catch(error => console.error('Error:', error));
}


  deassist(event) {
    event.preventDefault()
    const eventUserId = this.buttonTarget.id.split(" ")[0];
    const eventId = this.buttonTarget.id.split(" ")[1];
    console.log(eventId);

    // const url = `/event_users/${eventUserId}`;

    const url = `/event_users/${eventId}?event_id=${eventId}&&eventuser_id=${eventUserId}`;

    fetch(url, {
      method: 'DELETE',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
      }
    })
    .then(response => {
      if (response.ok) {
        return response.json();
      } else {
        throw new Error('Network response was not ok.');
      }
    })
    .then(data => {
      console.log(data);
      if (data.success) {
    const eventId = this.buttonTarget.id.split(" ")[1];
    console.log(eventId);
    this.buttonTarget.classList.remove("bookmark-type-attended");
    this.buttonTarget.classList.add("bookmark-type");
    this.buttonTarget.innerHTML = `<i class="fa-solid fa-plus"></i>`;
    this.buttonTarget.setAttribute("data-action", "click->changebutton#assist");
    this.buttonTarget.setAttribute("id", eventId);
    this.buttonTarget.setAttribute("data-changebutton-target", "buttonjoin");
  }
  else {
    // Handle error
    console.error('Error:', data.message);
  }
})
.catch(error => console.error('Error:', error));
}
}
