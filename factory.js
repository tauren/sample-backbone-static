// Example of the Factory patter using Backbone classProperties
// Courtesy of Johnny Oshika

// Input is an abstract class and should not be invoked directly
var Input = Backbone.Model.extend({
  say: function(){
    console.log('I am a ' + this.type);
  }
}, {
  create: function (attributes, options) {
    switch (options.type) {
      case 'text':
        return new TextInput(attributes, options);
      case 'check':
        return new CheckInput(attributes, options);
      default:
        throw new Error('Input type "' + options.type + '" not supported.');
    }
  }
});

var TextInput = Input.extend({
   type: 'text'
});

var CheckInput = Input.extend({
   type: 'check'
});

var myInput1 = Input.create(null, {type: 'text'});
var myInput2 = Input.create(null, {type: 'check'});

myInput1.say(); // I am a text
myInput2.say(); // I am a check

