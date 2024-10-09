// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import * as Rails from "@rails/ujs";

// Start Rails UJS to handle non-GET requests like DELETE for logout
Rails.start();