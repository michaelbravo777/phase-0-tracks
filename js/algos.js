
//
//
//
//
//
//
//
//loop through the array and compare the length of each string,
//if a string is longer than the last then save it.
function Find_longest_element(array) {

	var longest_element = ""

	for (var i = 0; i < array.length; i++) {
		if (array[i].length > longest_element.length) {
			longest_element = array[i]
		}
	}
	return longest_element
}

var phrases = ["long phrase","longest phrase","longer phrase"]
console.log(Find_longest_element(phrases))

var phrases = ["0123","0123456789","0123","01234567","012345678901234567890","0123456789012345"]
console.log(Find_longest_element(phrases))

var phrases = ["Lorem ipsum dolor sit amet","consectetur adipiscing elit","sed do eiusmod tempor incididunt","ut labore et dolore magna aliqua Ut enim ad minim veniam quis nostrud","exercitation ullamco laboris"]
console.log(Find_longest_element(phrases))
