var _         = require('underscore'),
    Backbone  = require('backbone');

var Sample = Backbone.Model.extend({
  initialize: function() {
  }
},{
  message: "No message has been set",
  setMessage: function(value) {
    this.message = value;
  }
});

Sample.setMessage("Hello World");
console.log(Sample.message); // Hello World

var s = new Sample();
console.log(s.constructor.message); // Hello World

Sample.setMessage("Goodbye!");
console.log(s.constructor.message); // Goodbye!
console.log(s.message);   // undefined