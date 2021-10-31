/**
 * 
 */

console.log("hi");


var d = new Date(),
	minutes = d.getMinutes().toString().length == 1 ? '0' + d.getMinutes() : d.getMinutes(),
	hours = d.getHours().toString().length == 1 ? '0' + d.getHours() : d.getHours(),
	ampm = d.getHours() >= 12 ? 'pm' : 'am',
	months = ['January', 'Febuary', 'March', 'April', 'May', 'June',  'July', 'August' , 'September', 'October', 'November', 'December'],
	days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
document.getElementById("date-time").innerHTML = days[d.getDay()] + ', ' + months[d.getMonth()] + ' ' + d.getDate() + ', ' + d.getFullYear() + ' ' + hours + ':' + minutes + ' ' + ampm;
if (ampm == 'pm') {
	document.getElementById("hello").innerHTML = "Good Afternoon";
} else {
	document.getElementById("hello").innerHTML = "Good Morning";
}


//word generator 
var NumberOfWords = 28

var words = new BuildArray(NumberOfWords)

words[1] = "witchcraft"
words[2] = "vampire"
words[3] = "mummy"
words[4] = "pumpkin"
words[5] = "fairy"
words[6] = "ninja"
words[7] = "trick-or-treat"
words[8] = "ghost"
words[9] = "bogeyman"
words[10] = "bone"
words[11] = "broomstick"
words[12] = "coffin"
words[13] = "devil"
words[14] = "evil"
words[15] = "spell"
words[16] = "fright"
words[17] = "hocus pocus"
words[18] = "magic"
words[19] = "monster"
words[20] = "mask"
words[21] = "nightmare"
words[22] = "ogre"
words[23] = "phantom"
words[24] = "potion"
words[25] = "scarecrow"
words[26] = "skeleton"
words[27] = "spider"
words[28] = "spooky"

function BuildArray(size){
this.length = size
for (var i = 1; i <= size; i++){
this[i] = null}
return this
}


function PickRandomWord(arr) {
var rand = Math.ceil(Math.random() * NumberOfWords)

document.getElementById('randWord').innerHTML = words[rand];
}
document.getElementById('randGen').addEventListener('click', PickRandomWord);
