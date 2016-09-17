//	7.3 Solo Challenge: Algorithm Practice
//
//************************************************
//     functions
//************************************************
//
//loop through the array
//	compare the length of each string
//	if a string is longer than the last then save it
function find_longest_element(array) {

	var longest_element = ""

	for (var i = 0; i < array.length; i++) {
		if (array[i].length > longest_element.length) {
			longest_element = array[i]
		}
	}
	return longest_element
}
//
//create a nested loop
//loop through 1st object
//	for each instance of object 1
//	loop through object 2 and look for a match
//	if found return true
function key_value_match(object1, object2) {

	for (var key1 in object1) {
		for (var key2 in object2) {
			if (key1 == key2 && object1[key1] == object2[key2]) {
				return true
			}
		}
	}
	return false
}
//
//************************************************
//     driver code
//************************************************
//
//
//************************************************
//     Release 0: Find the Longest Phrase
//************************************************
var phrases = ["long phrase","longest phrase","longer phrase"]
console.log("\nLongest phrase in [" + phrases + "] is:")
console.log(find_longest_element(phrases))

var phrases = ["0123","0123456789","0123","01234567","012345678901234567890","0123456789012345"]
console.log("\nLongest phrase in [" + phrases + "] is:")
console.log(find_longest_element(phrases))

var phrases = ["Lorem ipsum dolor sit amet","consectetur adipiscing elit","sed do eiusmod tempor incididunt","ut labore et dolore magna aliqua Ut enim ad minim veniam quis nostrud","exercitation ullamco laboris"]
console.log("\nLongest phrase in [" + phrases + "] is:")
console.log(find_longest_element(phrases))
//
//
//************************************************
//     Release 1: Find a Key-Value Match
//************************************************
var key_value_pair1 = {
    "a1" : "aliqua",
    "a2" : "ullamco",
    "a3" : "lorem",
    "a4" : "ipsum",
    "a5" : "dolor",
    "a6" : "amet"
  }

var key_value_pair2 = {
    "b1" : "sit",
    "b2" : "sed",
    "b3" : "tempor",
    "b4" : "adipiscing",
    "b5" : "consectetur",
    "b6" : "eiusmod",
  }

console.log("\n" + key_value_match(key_value_pair1, key_value_pair2))

var key_value_pair1 = {
    "a1" : "aliqua",
    "a2" : "ullamco",
    "a3" : "lorem",
    "a4" : "ipsum",
    "a5" : "dolor",
    "a6" : "amet"
  }

var key_value_pair2 = {
    "b1" : "sit",
    "b2" : "sed",
    "b3" : "tempor",
    "b4" : "adipiscing",
    "b5" : "consectetur",
    "b6" : "eiusmod",
    "a6" : "amet"
  }

console.log("\n" + key_value_match(key_value_pair1, key_value_pair2))
