//
//  AnnotationVC.swift
//  MapsTest
//
//  Created by Rivile on 1/19/20.
//  Copyright © 2020 Rivile. All rights reserved.
//

import UIKit
import MapKit
class AnnotationVC: UIViewController {
    let stadiums = [Stadium(name: "Emirates Stadium", lattitude: 51.5549, longtitude: -0.108436),
    Stadium(name: "alaa Bridge", lattitude: 51.4816, longtitude: -0.191034),
    Stadium(name: "White Hart Lane", lattitude: 51.6033, longtitude: -0.065684),
    Stadium(name: "Olympic Stadium", lattitude: 51.5383, longtitude: -0.016587),
    Stadium(name: "Old Trafford", lattitude: 53.4631, longtitude: -2.29139),
    Stadium(name: "Anfield", lattitude: 53.4308, longtitude: -2.96096)]
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //locationManager.delegate = self
        
        fetchStadiumsOnMap(stadiums)
    }
    
    func fetchStadiumsOnMap(_ stadiums: [Stadium]) {
      for stadium in stadiums {
        let annotations = MKPointAnnotation()
        annotations.title = stadium.name
        annotations.coordinate = CLLocationCoordinate2D(latitude:
          stadium.lattitude, longitude: stadium.longtitude)
        mapView.addAnnotation(annotations)
      }
    }

}
