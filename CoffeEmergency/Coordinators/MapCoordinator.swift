//
//  MapCoordinator.swift
//  CoffeEmergency
//
//  Created by Miles Au on 2020-08-13.
//  Copyright © 2020 Miles Au. All rights reserved.
//

import UIKit

protocol MapCoordinatorDelegate: class {
    func mapCoordinatorDidFinish()
}

class MapCoordinator: Coordinator{
    private(set) var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    var delegate: MapCoordinatorDelegate?
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let mapViewController: MapViewController = .instantiate()
        let mapViewModel = MapViewModel()
        mapViewModel.coordinator = self
        mapViewController.viewModel = mapViewModel
        navigationController.pushViewController(mapViewController, animated: true)
    }
    
    func didFinish(){
        delegate?.mapCoordinatorDidFinish()
    }
}
