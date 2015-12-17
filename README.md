#Interact Puzzles
by Alex Lee

https://interact-puzzle.herokuapp.com/

* [About](#about)
* [Approach](#approach)
* [Features](#features)
* [Bugs](#bugs)
* [Gems/Plugins](#GemsPlugins)


##<a name="about"></a>About
Interact Puzzles is a web application that turns any image into a puzzle. Users can register and upload and share puzzles.

##<a name="approach"></a>Approach
I started by coding the javascript functions that would generate and run the puzzle "game". The challenge I set myself was to shuffle the puzzle pieces in the puzzle area. 

Once the puzzle functionality was complete and running smoothly, I added the user sign up and sign in functions to the app. I created the main page to show all user puzzles so that when the page is first visited you get the option to play a puzzle straight away. The last part to complete was the user's ability to upload images to generate and share their own puzzles and a page to view the users puzzles.

##<a name="features"></a>Features
* User accounts for uploading images to be played as puzzles
* Puzzles can be played on a grid of 3x3, 5x5, 7x7 or 9x9
* Puzzles can even be shared by using the url https://interact-puzzle.herokuapp.com/puzzles/[puzzle name]/[grid size]
e.g. https://interact-puzzle.herokuapp.com/puzzles/Apollo/3
Naturally, this means a grid of almost any size can be played. Can make for some crazy puzzles!


##<a name="bugs"></a>Bugs
* If you place a puzzle piece close enough to a position on the board without actually making it snap in place, then place the correct puzzle piece in that position, you will be unable to move the first piece and hence unable to complete the puzzle.

##<a name="GemsPlugins"></a>Gems/Plugins
* interact.js   (http://interactjs.io/)
  - interact.js is a jQuery plugin that provides functions to create drag and drop, resizing, and multitouch in javascript.

* Cloudinary    (https://github.com/cloudinary/cloudinary_gem)
  - Cloudinary is a cloud services that allows user to upload images and videos with editing capabilities.

* Paloma    (https://github.com/kbparagua/paloma)
  - This ruby gem provides the ability to create page-specific javascript. It also allows you to pass Ruby/Rails params into your javascript files.