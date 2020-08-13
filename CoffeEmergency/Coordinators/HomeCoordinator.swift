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
        let homeViewController: HomeViewController = .instantiate()
        navigationController.setViewControllers([homeViewController], animated: false)
    }
    
    func didFinish(){
        delegate?.homeCoordinatorDidFinish()
    }
}
