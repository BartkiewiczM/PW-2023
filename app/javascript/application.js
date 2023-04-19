// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

import { Turbo } from "@hotwired/turbo-rails";
import Rails from "@rails/ujs"
Rails.start()

// import { Turbo } from "@hotwired/turbo-rails"
// import * as ActiveStorage from "@rails/activestorage"
// import "channels"

// ActiveStorage.start()
