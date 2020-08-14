//
//  MapViewController.swift
//  CoffeEmergency
//
//  Created by Miles Au on 2020-08-13.
//  Copyright © 2020 Miles Au. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var viewModel: MapViewModel? {
        willSet {
            viewModel?.viewDelegate = nil
        }
        didSet {
            viewModel?.viewDelegate = self
        }
    }
    
    var focusedLocation = CLLocationCoordinate2D()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        zoomToLocation()
        mapView.showsUserLocation = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        viewModel?.viewDidFinish()
    }

    func zoomToLocation(){
        // set region to focused location (where cafe is)
        let viewRegion = MKCoordinateRegion(center: focusedLocation, latitudinalMeters: 100, longitudinalMeters: 100)
        mapView.setRegion(viewRegion, animated: true)

        // put pin on cafe
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: focusedLocation.latitude, longitude: focusedLocation.longitude)
        mapView.addAnnotation(annotation)
    }
}

// MARK: - Receive updates from Map View Model
extension MapViewController: MapViewModelViewDelegate{
    
}
