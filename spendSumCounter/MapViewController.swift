//
//  MapViewController.swift
//  spendSumCounter
//
//  Created by Admin on 08.06.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var MapView: MKMapView!
    let locationManager = CLLocationManager()
    var annotation: MKPointAnnotation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard self.annotation == nil  else {
            guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
            self.annotation = MKPointAnnotation()
            self.annotation?.coordinate = locValue
            MapView.addAnnotation(self.annotation!)
            return
        }
        MapView.addAnnotation(self.annotation!)
    }
}
