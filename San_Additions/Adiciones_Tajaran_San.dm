/*
Tajaran frontflip proof of concept

Design:

1) Using the inherent verbs, we'll create a proc that will be added to the Taajran
2) This allows him to move 3 squares in front of where he's facing, he'll be able to jump over determinate dense objects in the whole trajectory
3) Can crash against walls and dense objects by checking if a dense object or a dense turf is in it's way, if it is, it'll stop in the tile before it.

Possibilites:

1- Backflips too.

*/

// Tajarans now have regular heat discomfort level but they get additional bodytemperature heat from clothing, as checked in their
// handle_enviroment_special()
// And now head discomfort is checked by the body temperature

/datum/species/tajaran
	heat_discomfort_level = 314

	// Reminder that this var exists.
	// The body will try to lower itself to this temperature
	// Tajarans bodytemp would RISE to this temperature in their natural habitat, becuase their natural habitat is 292K while the station is 298K
	// They'd feel a lot of cold, that'd substract heat from them, but their fur "adds it back".
	// So, what they do in station is have their regular body temperature, but they'd easily get discomfort by wearing too much clothing
	// Not by just wearing "something that covers their chest and balls" >:C
	//body_temperature = 310.15
	slowdown = -0.2

	heat_level_1 = 330 //Default 330
	heat_level_2 = 380 //Default 380
	heat_level_3 = 800 //Default 800
