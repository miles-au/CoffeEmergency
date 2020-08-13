//
//  HomeViewModel.swift
//  CoffeEmergency
//
//  Created by Miles Au on 2020-08-13.
//  Copyright © 2020 Miles Au. All rights reserved.
//

import Foundation

protocol HomeViewModelViewDelegate: class
{
    func fetchCafesDidRespond(with: Result<[CafeModel], Error>)
}

class HomeViewModel: CafeManagerDelegate{
    var coordinator: HomeCoordinator?
    var viewDelegate: HomeViewModelViewDelegate?
    var cafeManager = CafeManager()
    
    init() {
        cafeManager.delegate = self
    }
    
    /// Navigate to Map page to display businesses in map view
    func showMap(){
        coordinator?.showMap()
    }
    
    /// send request to Model to fetch cafes
    func fetchCafes(){
        cafeManager.fetchCafes()
    }
    
    /// receive resuilt from request to cafes
    func didFetchCafes(with result: Result<[CafeModel], Error>) {
        viewDelegate?.fetchCafesDidRespond(with: result)
    }
}
