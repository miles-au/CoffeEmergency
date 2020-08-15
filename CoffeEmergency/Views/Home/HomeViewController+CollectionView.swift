//
//  HomeViewController+CollectionView.swift
//  CoffeEmergency
//
//  Created by Miles Au on 2020-08-13.
//  Copyright © 2020 Miles Au. All rights reserved.
//

import UIKit

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionViewSetup(){
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // register cells
        collectionView.register(UINib(nibName:CafeCollectionViewCell.nibName, bundle: nil), forCellWithReuseIdentifier: CafeCollectionViewCell.reuseIdentifier)
        
        // register header
        collectionView.register(UINib(nibName: HomeHeaderCollectionReusableView.nibName, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeHeaderCollectionReusableView.reuseIdentifer)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var numberOfColumns = 1
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        let aspectRatio = CGFloat(0.75) // Width / Height
        
        if width > height{
            // landscape
            numberOfColumns = width < 812 ? 2 : 3
        } else{
            // portrait
            numberOfColumns = width < 415 ? 1 : 2
        }
        
        let cellSize = width / CGFloat(numberOfColumns) - 10
        
        return CGSize(width: cellSize, height: cellSize * aspectRatio)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cafes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CafeCollectionViewCell.reuseIdentifier, for: indexPath) as! CafeCollectionViewCell
        cell.update(with: viewModel.cafes[indexPath.row], and: viewModel)
        return cell
    }
    
    // MARK: Collection Header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomeHeaderCollectionReusableView.reuseIdentifer, for: indexPath)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
}
