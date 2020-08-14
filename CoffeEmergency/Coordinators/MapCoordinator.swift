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
    
    var selectedCafe: CafeModel?
    var cafes = [CafeModel]()
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        // create view controller
        let mapViewController: MapViewController = .instantiate()
        mapViewController.selectedCafe = selectedCafe
        mapViewController.cafes = cafes
        
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
