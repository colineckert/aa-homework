// Phase 1: Callbacks

function titleize(names, printCallback) {
  let titleized = names.map(el => `Mx. ${el} Jingleheimer Schmidt`);
  printCallback(titleized);
}

titleize(["Mary", "Brian", "Leo"], (names) => {
  names.forEach(name => console.log(name))
});

// Phase 2: Constructors, Prototypes, and this

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function() {
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
}

Elephant.prototype.grow = function() {
  this.height += 12;
}

Elephant.prototype.addTrick = function(trick) {
  this.tricks.push(trick);
}

Elephant.prototype.play = function(name) {
  let trickIdx = Math.floor(Math.random() * this.tricks.length)
  let trick = this.tricks[trickIdx]
  console.log(`${this.name} is ${trick}!`)
}

// Phase 3: Function Invocation

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

Elephant.paradeHelper = function(ele) {
  console.log(`${ele.name} is trotting by!`);
}

herd.forEach(ele => Elephant.paradeHelper(ele));

// Phase 4: Closures

function dinerBreakfast() {
  let order = "I'd like scrambled eggs and bacon please.";
  console.log(order);

  return function (food) {
    order = `${order.slice(0, order.length - 8)} and ${food} please.`;
    console.log(order);
  }
}