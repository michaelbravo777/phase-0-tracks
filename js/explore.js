//pass a string to reverse function
//loop from last letter of string backwards to first
//add each letter to output string
//
function reverse(string) {
	var output_string = "";
	for (var i = string.length - 1; i >= 0; i--) {
		output_string += string[i];
	}
	return output_string
}

var reversed_string

reversed_string = reverse("marco pollo");

if ("marco pollo" == reverse(reverse("marco pollo"))) {
	console.log(reversed_string);
}
