// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require_tree .
//= require jquery 
//= require jquery_ujs
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"

import { far } from "@fortawesome/free-regular-svg-icons"
import { fas } from "@fortawesome/free-solid-svg-icons"
import { fab } from "@fortawesome/free-brands-svg-icons"
import { library } from "@fortawesome/fontawesome-svg-core"
import "@fortawesome/fontawesome-free"
library.add(far, fas, fab)
import Rails from "@rails/ujs"
Rails.start()


function logout() {
  $current_user = User.new
  return true;
}
