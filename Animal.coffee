_ = require 'underscore'
Backbone = require 'backbone'

class Animal extends Backbone.Model
  # constructor: (attr, opts) ->
    # super attr, opts
    # Backbone.Model.prototype.constructor.call @, attr, opts

  # Distance this animal instance has moved
  distance: 0

  # Move this animal instance
  move: (meters) ->
    # Display message about animal and distance moved
    console.log "#{@get('name')} #{@constructor.motion} #{meters}m."
    # Record distance move by this animal instance
    @distance += meters
    # console.log @constructor.name
    # Record this distance in static storage
    @constructor.addDistance @, meters

  # Get the distance this animal instance moved
  getDistance: ->
    @distance

  # Static storage object to record total distances moved 
  # by each animal type
  @distances: {}

  # Static function to add a distance to an animal type
  @addDistance: (inst, meters) ->
    # Get the type of anmial to add a distance to
    type = inst.constructor.type
    # Exit if running on the base Animal class
    return if not type
    # Retrieve data or initalize this type in storage
    @distances[type] = @distances[type] or 0
    # Add new distance to total animal type distance
    @distances[type] += meters
  
  # Static function to retrieve the distance moved by an 
  # animal type. If called on base Animal, returns total 
  # distance for all animals
  @getDistance: ->
    # Return distance moved by just one type of animal
    return @distances[@type] if @type
    # Get an array of distances moved by each animal type
    meters = (val for key, val of @distances)
    # Return the sum of all distances moved by all animals
    _.reduce(meters, ((memo, num) -> memo + num), 0)

class Snake extends Animal
  @type: 'Snake'
  @motion: 'slithers'
  move: (m)->
    console.log "#{@get('name')} hides under a rock"
    super m

class Horse extends Animal
  @type: 'Horse'
  @motion: 'gallops'

sam = new Snake 
  name: 'Sammy the Python'
tom = new Horse 
  name: 'Tommy the Palomino'
jon = new Horse 
  name: 'Jonny the Arabian'
sam.move(5)
tom.move(45)
jon.move(40)
sam.move(10)
console.log "Sammy moved #{sam.getDistance()}m total."
console.log "Tommy moved #{tom.getDistance()}m total."
console.log "Jonny moved #{jon.getDistance()}m total."
console.log "All snakes moved #{Snake.getDistance()}m."
console.log "All horses moved #{Horse.getDistance()}m."
console.log "All animals moved #{Animal.getDistance()}m."
