//
//  CafeCollectionViewCell.swift
//  CoffeEmergency
//
//  Created by Miles Au on 2020-08-13.
//  Copyright © 2020 Miles Au. All rights reserved.
//

import UIKit

class CafeCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "CafeCollectionViewCell"
    static let nibName = "CafeCollectionViewCell"
    
    var viewModel: HomeViewModel?
    var latitude: Double?
    var longitude: Double?
    
    @IBOutlet weak var coverPhotoImageView: UIImageView!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var cafeName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func update(with cafe: CafeModel, and viewModel: HomeViewModel){
        self.viewModel = viewModel
        
        // set ui properties
        cafeName.text = cafe.name
        coverPhotoImageView.downloaded(from: cafe.imageURL)
        distanceLabel.text = "📐 \(Double(round(10 * cafe.distance)/1000))m"
        if let priceText = cafe.price{
            priceLabel.text = "🏷 \(priceText)"
        }else{
            priceLabel.isHidden = true
        }
        ratingLabel.text = "⭐️ \(cafe.rating)"
        
        // set coordinates
        latitude = cafe.latitude
        longitude = cafe.longitude
    }
    
    @IBAction func showOnMapButtonPressed(_ sender: UIButton) {
        if let latitude = latitude, let longitude = longitude{
            viewModel?.showMap(at: latitude, and: longitude)
        }
    }
    
}
