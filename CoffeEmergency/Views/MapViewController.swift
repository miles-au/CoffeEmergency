//
//  MapViewController.swift
//  CoffeEmergency
//
//  Created by Miles Au on 2020-08-13.
//  Copyright © 2020 Miles Au. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {
    
    var viewModel: MapViewModel? {
        willSet {
            viewModel?.viewDelegate = nil
        }
        didSet {
            viewModel?.viewDelegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        viewModel?.viewDidFinish()
    }
}

// MARK: - Receive updates from Gallery View Model
extension MapViewController: MapViewModelViewDelegate{
    
}
