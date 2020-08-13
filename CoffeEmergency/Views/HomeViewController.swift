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
    
    var viewModel: HomeViewModel!
    var cafes = [CafeModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSetup()
        
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
        switch result {
        case .failure(let error):
            FetchStatusLabel.text = error.localizedDescription
        case .success(let cafes):
            self.cafes = cafes
            FetchStatusStackView.isHidden = true
            collectionView.reloadData()
        }
    }
}

// MARK: - Collection View
extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionViewSetup(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName:CafeCollectionViewCell.nibName, bundle: nil), forCellWithReuseIdentifier: CafeCollectionViewCell.reuseIdentifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var numberOfColumns = 1
        let width = view.frame.size.width - 10
        let height = view.frame.size.height - 10
        let aspectRatio = CGFloat(0.75) // Width / Height
        
        if width > height{
            // landscape
            numberOfColumns = width < 812 ? 2 : 3
        } else{
            // portrait
            numberOfColumns = width < 415 ? 1 : 2
        }
        
        let cellSize = width / CGFloat(numberOfColumns)
        
        return CGSize(width: cellSize, height: cellSize * aspectRatio)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cafes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CafeCollectionViewCell.reuseIdentifier, for: indexPath) as! CafeCollectionViewCell
        cell.update(with: cafes[indexPath.row])        
        return cell
    }
}
