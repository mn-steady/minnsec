// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import "@hotwired/turbo-rails";
import "controllers";
import { start as UJSStart } from "@rails/ujs";

// Initialize Rails UJS to handle non-GET requests like DELETE for logout
UJSStart();
