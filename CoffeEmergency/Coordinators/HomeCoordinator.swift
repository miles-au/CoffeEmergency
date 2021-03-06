//
//  HomeCoordinator.swift
//  CoffeEmergency
//
//  Created by Miles Au on 2020-08-13.
//  Copyright © 2020 Miles Au. All rights reserved.
//

import UIKit

protocol HomeCoordinatorDelegate: class {
    func homeCoordinatorDidFinish() // We probably don't need this for home class, but we'll do it for consistency and just in case
}

class HomeCoordinator: Coordinator{
    private(set) var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    var delegate: HomeCoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        // create view controller
        let homeViewController: HomeViewController = .instantiate()
        
        // create view model
        let homeViewModel = HomeViewModel()
        homeViewModel.coordinator = self
        homeViewController.viewModel = homeViewModel
        
        // push view controller
        navigationController.setViewControllers([homeViewController], animated: false)
    }
    
    func didFinish(){
        delegate?.homeCoordinatorDidFinish()
    }
}


// MARK: - Navigation to Map Page
extension HomeCoordinator: MapCoordinatorDelegate {

    func showMap(at cafe: CafeModel?, with cafes: [CafeModel]){
        let mapCoordinator = MapCoordinator(navigationController: navigationController)
        childCoordinators.append(mapCoordinator) // append coordinator to prevent de-allocation
        mapCoordinator.delegate = self
        mapCoordinator.selectedCafe = cafe
        mapCoordinator.cafes = cafes
        mapCoordinator.start()
    }
    
    func mapCoordinatorDidFinish() {
        // find the MapCoordinator in child coordinators and remove it
        if let index = childCoordinators.firstIndex(where: { childCoordinator -> Bool in
            return childCoordinator is MapCoordinator
        }){
            childCoordinators.remove(at: index)
        }
    }
}
