//
//  HomeViewModel.swift
//  CoffeEmergency
//
//  Created by Miles Au on 2020-08-13.
//  Copyright © 2020 Miles Au. All rights reserved.
//

import Foundation

class HomeViewModel{
    var coordinator: HomeCoordinator?
    
    func showMap(){
        coordinator?.showMap()
    }
}
