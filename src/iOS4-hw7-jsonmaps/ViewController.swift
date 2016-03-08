//
//  ViewController.swift
//  iOS4-hw7-jsonmaps
//
//  Created by Kathryn Rotondo on 2/27/16.
//  Copyright © 2016 Kathryn Rotondo. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import SwiftyJSON

// @TODO 1-5 Add SwiftyJSON to project
// @TODO 6 Edit info.plist

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    
    var pins:[Pin] = []
    // @TODO 7 Add endpoint
    
    let endpoint = "http://kathrynrotondo.com/ios4/pins.json"

    
    let latitude:CLLocationDegrees = 37.77
    let longitude:CLLocationDegrees = -122.45
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // centers map on San Francisco
        centerMapOnLocation(latitude, longitude: longitude)
        
        // @TODO 9: call loadData
        let urlString = "\(endpoint)"
        loadData(urlString)
        
        
        // adds a sample pin
        let pin = Pin(title: "GA", latitude: 37.7908727, longitude: -122.4034906)
        pins.append(pin)
        
        // @TODO 11: iterates through the pin array to add pins to map
        for pin in pins {
            addAnnotation(pin)
        }
    }
    
    func centerMapOnLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        
        // gets the center point
        let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        // gets the zoom
        let radius:CLLocationDistance = 18000 // in meters
        
        // creates a region showing center at zoom and sets it on map
        let region = MKCoordinateRegionMakeWithDistance(coordinate, radius, radius)
        map.setRegion(region, animated: true)
    }
    

    

    
    // @TODO 7 Create a loadData function
    
        func loadData(urlString: String){
            if let url = NSURL(string: urlString) {
    
                if let data = try? NSData(contentsOfURL: url, options: [])
                {
                    let json = JSON(data: data)
                    
                    if json["cod"].intValue == 200 {
                        print("200 , ok ")
                        
                        // @TODO 10 inside loadData, call parseData
                        parseData(json)


                    }
                }
            }
    }
    
            
    
 
    
    // @TODO 8 Create a parseData function
    func parseData(json:JSON) {
        
        for result in json["pin"].arrayValue // just to get the dictionary back
        {
            let title  = result["title"].stringValue
            let latitude  = result["latitude"].double
            let longitude = result["longitude"].double
            let pin = Pin(title:title,latitude:latitude!,longitude:longitude!)
            
            pins.append(pin)
            
            
        }
    }

    
                    
    
    func addAnnotation(pin:Pin) {
        
        // creates an MKPointAnnotation
        let annotation:MKPointAnnotation = MKPointAnnotation()
        
        // sets its properties
        let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(pin.latitude, pin.longitude)
        annotation.coordinate = coordinate
        annotation.title = pin.title
        
        // adds it to the map
        map.addAnnotation(annotation)
    }
}