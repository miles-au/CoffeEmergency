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
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var toMapButton: UIButton!
    
    var viewModel: HomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSetup()
        
        viewModel.viewDelegate = self
        viewModel.getUserLocation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupToMapButton()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        // on orientation change, layout collection view again to update cell sizes
        coordinator.animate(
            alongsideTransition: { _ in
                self.collectionView.collectionViewLayout.invalidateLayout()
        }, completion: nil )
    }
    
    func changeStatusLabel(text: String){
        FetchStatusLabel.text = text
    }
    
    func setupToMapButton(){
        // set border
        toMapButton.layer.cornerRadius = 10
        toMapButton.layer.borderWidth = 2.5
        toMapButton.layer.borderColor = UIColor(named: "BrandLightBrown")?.cgColor
        
        // create map background image
        let tintView = UIImageView()
        tintView.frame = toMapButton.bounds
        tintView.image = UIImage(named: "DusseldorfMap")
        tintView.contentMode = .scaleAspectFill
        tintView.alpha = CGFloat(0.4)
        toMapButton.addSubview(tintView)
        
        // create label inside
        let label = UILabel()
        label.font = UIFont(name: "Futura-Medium", size: 18.0)
        label.text = "Map"
        label.textColor = UIColor(named: "BrandBeige")
        label.textAlignment = .center
        label.backgroundColor = UIColor(named: "BrandGreen")
        label.layer.cornerRadius = 20
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        toMapButton.addSubview(label)
        toMapButton.bringSubviewToFront(label)
        
        // center label
        label.centerXAnchor.constraint(equalTo: toMapButton.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: toMapButton.centerYAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 40).isActive = true
        label.widthAnchor.constraint(equalToConstant: 75).isActive = true
    }
    
    @IBAction func toMapButtonPressed(_ sender: UIButton) {
        viewModel.showMap(at: nil, with: viewModel.cafes)
    }
}

// MARK: - Communication with ViewModel
extension HomeViewController: HomeViewModelViewDelegate{
    func fetchCafesDidRespond(with result: Result<[CafeModel], Error>) {
        switch result {
        case .failure(let error):
            changeStatusLabel(text: error.localizedDescription)
        case .success(let cafes):
            viewModel.cafes = cafes
            DispatchQueue.main.async {
                self.FetchStatusStackView.isHidden = true
                self.collectionView.reloadData()
                self.toMapButton.isHidden = false
                self.toMapButton.isEnabled = true
                UIView.animate(withDuration: 0.5, delay: 1, options: [], animations: {
                    self.toMapButton.alpha = 1
                }, completion: nil)
            }
        }
    }
}
