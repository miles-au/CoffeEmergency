//
//  HomeViewController.swift
//  CoffeEmergency
//
//  Created by Miles Au on 2020-08-13.
//  Copyright © 2020 Miles Au. All rights reserved.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController {
    
    @IBOutlet weak var FetchStatusStackView: UIStackView!
    @IBOutlet weak var FetchStatusLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: HomeViewModel!
    var cafes = [CafeModel]()
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSetup()
        
        viewModel.viewDelegate = self
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    func changeStatusLabel(text: String){
        FetchStatusLabel.text = text
    }
}

// MARK: - Communication with ViewModel
extension HomeViewController: HomeViewModelViewDelegate{
    func fetchCafesDidRespond(with result: Result<[CafeModel], Error>) {
        switch result {
        case .failure(let error):
            changeStatusLabel(text: error.localizedDescription)
        case .success(let cafes):
            self.cafes = cafes
            DispatchQueue.main.async {
                self.FetchStatusStackView.isHidden = true
                self.collectionView.reloadData()
            }
        }
    }
}
