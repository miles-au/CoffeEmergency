//
//  MapViewModel.swift
//  CoffeEmergency
//
//  Created by Miles Au on 2020-08-13.
//  Copyright © 2020 Miles Au. All rights reserved.
//

import Foundation
import MapKit

class MapViewModel{
    var coordinator: MapCoordinator?
    
    var selectedCafe: CafeModel?
    var cafes = [CafeModel]()
    
    func viewDidFinish() {
        coordinator?.didFinish()
    }
    
    func openLocationInMap(){
        guard let cafe = selectedCafe else { return }
        
        // settings for launching in apple maps
        let regionDistance: CLLocationDistance = cafe.distance * 4
        let coordinates = CLLocationCoordinate2D(latitude: cafe.latitude, longitude: cafe.longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        
        // create placemark for cafe
        let cafePlacemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: cafePlacemark)
        mapItem.name = cafe.name

        MKMapItem.openMaps(with: [mapItem], launchOptions: options)
    }
}
