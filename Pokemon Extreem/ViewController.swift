//
//  ViewController.swift
//  Pokemon Extreem
//
//  Created by Muhaimin Habib on 4/2/17.
//  Copyright © 2017 Biswajit banik. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController , MKMapViewDelegate , CLLocationManagerDelegate{

    @IBOutlet weak var mapView: MKMapView!
    
    var manager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        manager.delegate = self
        
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            
            print("Ready to go ...")
            mapView.showsUserLocation = true
            manager.stopUpdatingLocation()
            
        }else{
        manager.requestWhenInUseAuthorization()
        }
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let region = MKCoordinateRegionMakeWithDistance((manager.location!.coordinate), 100 , 100)
        mapView.setRegion(region, animated: true)
        
        
    }
    

}

