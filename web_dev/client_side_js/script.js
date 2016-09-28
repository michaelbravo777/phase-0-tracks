console.log("The script is running!");

// Release 1
function addGreyBackground(event) {
  console.log("click happened! here's the click event:");
  console.log(event);
  event.target.style.background = "grey"
}

// Release 2
var background = document.getElementById("about-my-pet");
background.addEventListener("click", addGreyBackground)
