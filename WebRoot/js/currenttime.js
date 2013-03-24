
//Description: This Javascript displays the current time (hour:minute:second AM/PM format)
//in a text field on the webpage, updating the display once every second.

var currtime;
var currhour;
var currminute;
var currsecond;
var AP;

function writeTime()
{

currtime = new Date(); //creates representation of current time on user's local computer
currhour = currtime.getHours(); //gets current hour (in 24-hour format)
currminute = currtime.getMinutes(); //gets current minute
currsecond = currtime.getSeconds(); //gets current time

if (currminute < 10) //if current minute is one digit number
	currminute = "0" + currminute; //place zero in front of it

if (currsecond < 10) //if current second is one digit number
	currsecond = "0" + currsecond; //place zero in front of it

AP = (currhour >= 12 ? "PM" : "AM"); //determine whether it is AM or PM


if (currhour > 12) //if current time is past 1:00 PM (13:00)
	currhour -= 12; //reduce hour display by 12 (i.e. 20:00 becomes 8:00 PM)
else if(currhour == 0) //if it is currently the midnight hour
	currhour = 12; //give more friendly hour display (i.e. 12:30 AM instead of 0:30 AM)

document.forms[0].timeIn.value = currhour + ":" + currminute + ":" + currsecond + " " + AP; //update text field displaying time
setTimeout("writeTime()",1000); //set function to run again, 1 second from now (1000 milliseconds)
}
