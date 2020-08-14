//
//  HomeViewController+CLLocation.swift
//  CoffeEmergency
//
//  Created by Miles Au on 2020-08-13.
//  Copyright © 2020 Miles Au. All rights reserved.
//

import Foundation
import CoreLocation

extension HomeViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        
        // fetch cafes after receiving location
        viewModel.fetchCafes(at: location.coordinate.latitude, and: location.coordinate.longitude)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        changeStatusLabel(text: error.localizedDescription)
    }
}
