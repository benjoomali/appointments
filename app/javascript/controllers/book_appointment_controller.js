import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "slot", "selected" ]

    fire(e) {
        console.log("boom")
        console.log(e.srcElement)
    }
}
