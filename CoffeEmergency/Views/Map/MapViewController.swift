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
    
    var selectedCafe: CafeModel?
    var cafes = [CafeModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.mapType = .mutedStandard
        
        // set region to selected cafe location if exists
        if let latitude = selectedCafe?.latitude, let longitude = selectedCafe?.longitude{
            zoomMap(to: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
        }else{
            zoomMap(to: CLLocationCoordinate2D())
        }
        markCafes()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        viewModel?.viewDidFinish()
    }
    
    func zoomMap(to coordinates: CLLocationCoordinate2D){
        let viewRegion = MKCoordinateRegion(center: coordinates, latitudinalMeters: 100, longitudinalMeters: 100)
        mapView.setRegion(viewRegion, animated: true)
    }
    
    func markCafes(){
        var annotations = [CafeAnnotation]()
        for cafe in cafes{
            annotations.append(CafeAnnotation(cafe: cafe))
        }
        mapView.addAnnotations(annotations)
    }
}

// MARK: - Receive updates from Map View Model
extension MapViewController: MapViewModelViewDelegate{
    
}
