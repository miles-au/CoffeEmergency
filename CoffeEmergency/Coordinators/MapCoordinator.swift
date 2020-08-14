//
//  MapCoordinator.swift
//  CoffeEmergency
//
//  Created by Miles Au on 2020-08-13.
//  Copyright © 2020 Miles Au. All rights reserved.
//

import UIKit
import CoreLocation

protocol MapCoordinatorDelegate: class {
    func mapCoordinatorDidFinish()
}

class MapCoordinator: Coordinator{
    private(set) var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    var delegate: MapCoordinatorDelegate?
    
    var location: (Double?, Double?) // 0 - latitude, 1 - longitude
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        // create view controller
        let mapViewController: MapViewController = .instantiate()
        if let latitude = location.0, let longitude = location.1 {
            mapViewController.focusedLocation = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
        
        // create view model
        let mapViewModel = MapViewModel()
        mapViewModel.coordinator = self
        mapViewController.viewModel = mapViewModel
        
        // push view controller
        navigationController.pushViewController(mapViewController, animated: true)
    }
    
    func didFinish(){
        delegate?.mapCoordinatorDidFinish()
    }
}
