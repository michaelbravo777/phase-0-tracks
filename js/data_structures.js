var colors = ["blue", "green", "red", "yellow"];
var names = ["Ed", "Abu", "Bramble", "Domino"];

colors.push("orange");
names.push("Mr. Whiskers");

var horses = {};

for (var i = 0; i < colors.length; i++) {
	horses[names[i]] = colors[i];
}
console.log(horses)

function Car(model, year, automatic) {

	this.model = model;
	this.year = year;
	this.automatic = automatic;
	
	this.donut = function() { console.log("DOES DONUT!"); };

}

var bmw = new Car("M3", 2016, false);
var tesla = new Car("Model S", 2017, true);

console.log(bmw.model)
console.log(bmw.year)
console.log(bmw.automatic)
bmw.donut()

console.log(tesla.model)
console.log(tesla.year)
console.log(tesla.automatic)
tesla.donut()

for (var k in bmw){
    if (bmw.hasOwnProperty(k)) {
         console.log("Key is " + k + ", value is " + bmw[k]);
    }
}
