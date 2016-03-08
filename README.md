# Assignment 7: JSON (& Maps) 

Consume JSON data, parse it, and use it to display pins on the provided sample app. The assigned app contains an MKMapView and code to display pins from an array of pins. It also contains a series of todos for loading a JSON file to populate the pins array. Implementing these todos will give you familiarity with SwiftyJSON and will give you a starting point for consuming API data in your final project app.

## Goals of Project
Gain familiarity with setting up a project using Cocoapods, and consuming JSON data using SwiftyJSON.

## Project Requirements
Your app must meet all requirements laid out in the sample app. Format: Sample app has all input/output TODOs filled out and functioning.

1. Using the terminal, navigate to the project directory. You can do this by typing "cd " (note the space) and dragging the directory from Finder into the Terminal, then pressing enter. Type "ls" and look for your .xcodeproj file to confirm you are in the right place.
2. Type "pod init" to create a Podfile.
3. Open and edit the Podfile in TextEdit by typing "open Podfile". Add one line between the target and end lines: "pod 'SwiftyJSON'"
4. Close the project if you have it open in XCode
5. In Finder, open the new .xcworkspace file.
6. Edit info.plist to add "kathrynrotondo.com" as an Exception Domain in the App Transport Security Settings. This is a dictionary that needs to contain the boolean value NSThirdPartyExceptionAllowsInsecureHTTPLoads, which should both be set to yes. 
7. Add an endpoint constant at the top of the View Controller, which points to "http://kathrynrotondo.com/ios4/pins.json".
8. Create a function called loadData that fetches the json file from the above URL.
9. Call your loadData function from viewDidLoad. Note that waiting for a full file to download can cause an unresponsive UI; to deal with this gracefully would require Grand Central Dispatch (GCD) which is beyond the scope of this class.
10. Call your parseData function from loadData. Parse pin data out of the file, and store it as pins in your pins array.
11. Back in viewDidLoad, after the call to loadData, iterate through the pins array to create annotations and add them to the map.

## Deliverables
Assignment (code, resources, project file) posted on Github

## Timeline
Due Date: Monday, March 7, 2016 (by midnight).

## Suggested Ways to Get Started
* Understand the roles of [Cocoapods](https://cocoapods.org) (for dependency management) and [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON) (for parsing JSON in Swift).
* Load the JSON in a web browser to see it raw, then load it using the [JSON Formatter & Validator](https://jsonformatter.curiousconcept.com) so that you can surf it more easily.
* Review the process for adding annotations to a map.

## Evaluation
Your assignment will be evaluated regarding the extent to which you meet the above requirements using our usual rubric, which outlines how your assignment will be evaluated on readiness, stability & performance, and style & readability.