/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

console.log('Hello World from Webpacker')
$('.message').text("zomg it worked");

// Support component names relative to this directory:
import '../vendor/foundation.min.js'
var componentRequireContext = require.context("components", true)
var ReactRailsUJS = require("react_ujs")
ReactRailsUJS.useContext(componentRequireContext)

$(function(){ $(document).foundation(); });

class Thing {
  constructor(input) {
    this.thing = input;
  }

  printThing() {
    console.log(this.thing);
    return "ZOMG";
  }
};

let thing = new Thing("bob");
thing.printThing();
