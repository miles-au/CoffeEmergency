//
//  MapViewModel.swift
//  CoffeEmergency
//
//  Created by Miles Au on 2020-08-13.
//  Copyright © 2020 Miles Au. All rights reserved.
//

import Foundation

protocol MapViewModelViewDelegate: class
{
}

class MapViewModel{
    var coordinator: MapCoordinator?
    var viewDelegate: MapViewModelViewDelegate?
    
    func viewDidFinish() {
        coordinator?.didFinish()
    }
}
