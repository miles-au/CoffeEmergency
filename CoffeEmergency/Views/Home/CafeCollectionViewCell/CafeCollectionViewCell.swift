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
    var cafe: CafeModel!
    
    @IBOutlet weak var coverPhotoImageView: UIImageView!
    @IBOutlet weak var cafeName: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var showOnMapButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func update(with cafe: CafeModel, and viewModel: HomeViewModel){
        self.viewModel = viewModel
        
        // set cafe
        self.cafe = cafe
        
        // set up ui
        cafeName.text = cafe.name
        coverPhotoImageView.downloaded(from: cafe.imageURL)
        distanceLabel.text = "📐 \(StringUtils.toSingleDecimal(cafe.distance))m"
        if let priceText = cafe.price{
            priceLabel.text = "🏷 \(priceText)"
        }else{
            priceLabel.isHidden = true
        }
        showOnMapButton.layer.cornerRadius = 10
        
        // border
        layer.cornerRadius = 10
        layer.borderWidth = 2.5
        layer.borderColor = UIColor(named: "BrandBackgroundBrown")?.cgColor
        
        ratingLabel.text = "⭐️ \(cafe.rating)"
    }
    
    @IBAction func showOnMapButtonPressed(_ sender: UIButton) {
        if let viewModel = viewModel{
            viewModel.showMap(at: cafe, with: viewModel.cafes)
        }
    }
    
}
