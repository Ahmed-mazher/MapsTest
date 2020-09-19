//
//  ViewController.swift
//  MapsTest
//
//  Created by Rivile on 1/19/20.
//  Copyright © 2020 Rivile. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class MyLacationVC: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        mapView.showsUserLocation = true
        //locationManager.requestWhenInUseAuthorization()
    }
    // good ref
// https://www.iosapptemplates.com/blog/swift-programming/mapkit-tutorial
    
    @IBAction func lacationBtn(_ sender: Any) {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
           locationManager.startUpdatingLocation()
        } else {
           locationManager.requestWhenInUseAuthorization()
        }
        
        if
           CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
           CLLocationManager.authorizationStatus() ==  .authorizedAlways
        {
            currentLocation = locationManager.location
            print(currentLocation.coordinate.longitude)
            print(currentLocation.coordinate.latitude)
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.first!
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(coordinateRegion, animated: true)
        print(coordinateRegion.center.latitude)
        locationManager.stopUpdatingLocation()
    }
    
}


// link to search for a plaxce using google api
// https://medium.com/better-programming/easy-google-maps-setup-tutorial-swift-4-f6d5c093817e
