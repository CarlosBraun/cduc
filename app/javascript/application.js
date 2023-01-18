// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"

import { far } from "@fortawesome/free-regular-svg-icons"
import { fas } from "@fortawesome/free-solid-svg-icons"
import { fab } from "@fortawesome/free-brands-svg-icons"
import { library } from "@fortawesome/fontawesome-svg-core"
import "@fortawesome/fontawesome-free"
library.add(far, fas, fab)

import "custom/search"

function logout() {
    $current_user = User.new
    return true;
  }

$("tr[data-link]").click(function() {
  window.location = $(this).data("link")
})