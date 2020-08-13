//
//  HomeViewController.swift
//  CoffeEmergency
//
//  Created by Miles Au on 2020-08-13.
//  Copyright © 2020 Miles Au. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var FetchStatusStackView: UIStackView!
    @IBOutlet weak var FetchStatusLabel: UILabel!
    
    var viewModel: HomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDelegate = self
        viewModel.fetchCafes()
    }

//    @IBAction func onToMapPressed(_ sender: UIButton) {
//        viewModel?.showMap()
//    }
    
}

// MARK: - Communication with ViewModel
extension HomeViewController: HomeViewModelViewDelegate{
    func fetchCafesDidRespond(with result: Result<[CafeModel], Error>) {
        print("fetched result: \(result)")
    }
}

