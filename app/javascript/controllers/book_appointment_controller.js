import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "slot", "selected", "start", "end" ]

    fire(e) {
        console.log("boom")
        console.log(e.srcElement)
        console.log(e.srcElement.dataset.startTime)

        this.startTarget.value = e.srcElement.dataset.startTime
        this.endTarget.value = e.srcElement.dataset.endTime
    }
}
