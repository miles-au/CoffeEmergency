//
//  CafeAnnotation.swift
//  CoffeEmergency
//
//  Created by Miles Au on 2020-08-14.
//  Copyright © 2020 Miles Au. All rights reserved.
//

import Foundation
import MapKit

class CafeAnnotation : NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var cafe: CafeModel
    var title: String?
    var subtitle: String?
    
    init(cafe: CafeModel) {
        self.cafe = cafe
        self.coordinate = CLLocationCoordinate2D(latitude: cafe.latitude, longitude: cafe.longitude)
        self.title = cafe.name
        self.subtitle = "\(StringUtils.toSingleDecimal(cafe.distance))m away"
    }
}

class CafeAnnotationView: MKAnnotationView {
    private var imageView: UIImageView!
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        // setup image
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "activePin")
        addSubview(self.imageView)
        
        canShowCallout = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
