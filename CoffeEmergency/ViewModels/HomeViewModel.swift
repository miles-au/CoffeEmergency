//
//  HomeViewModel.swift
//  CoffeEmergency
//
//  Created by Miles Au on 2020-08-13.
//  Copyright © 2020 Miles Au. All rights reserved.
//

import Foundation
import CoreLocation

protocol HomeViewModelViewDelegate: class
{
    func fetchCafesDidRespond(with: Result<[CafeModel], Error>)
}

class HomeViewModel: NSObject, CafeManagerDelegate{
    var coordinator: HomeCoordinator?
    var viewDelegate: HomeViewModelViewDelegate?
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    
    var cafeManager = CafeManager()
    var cafes = [CafeModel]()
    
    override init() {
        super.init()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        cafeManager.delegate = self
    }
    
    /// Navigate to Map page to display businesses in map view
    func showMap(at cafe: CafeModel?, with cafes: [CafeModel]){
        coordinator?.showMap(at: cafe, with: cafes)
    }
    
    /// send request to Model to fetch cafes
    func fetchCafes(at latitude: Double, and longitude: Double){
        cafeManager.fetchCafes(at: latitude, and: longitude)
//        didFetchCafes(with: .success(CafeModel.tempData))
    }
    
    /// receive resuilt from request to cafes
    func didFetchCafes(with result: Result<[CafeModel], Error>) {
        viewDelegate?.fetchCafesDidRespond(with: result)
    }
}

// MARK: - CoreLocation Delegate
extension HomeViewModel: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        
        // fetch cafes after receiving location
        fetchCafes(at: location.coordinate.latitude, and: location.coordinate.longitude)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        viewDelegate?.fetchCafesDidRespond(with: .failure(error))
    }
}
