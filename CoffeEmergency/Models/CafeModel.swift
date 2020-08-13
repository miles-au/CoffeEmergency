//
//  CafeModel.swift
//  CoffeEmergency
//
//  Created by Miles Au on 2020-08-13.
//  Copyright © 2020 Miles Au. All rights reserved.
//

import Foundation

struct CafeModel{
    let name: String
    let imageURL: String
    let yelpURL: String
    let open: Bool
    let rating: Double
    let price: String? // $, $$, $$$
    let phone: String
    let distance: Double
    
    // Coordinates
    let latitude: Double
    let longitude: Double
    
    // Using display address for now
    let address: String
    
    static func from(cafeData: Business) -> CafeModel{
        return CafeModel(name: cafeData.name, imageURL: cafeData.image_url, yelpURL: cafeData.url, open: !cafeData.is_closed, rating: cafeData.rating, price: cafeData.price, phone: cafeData.display_phone, distance: cafeData.distance, latitude: cafeData.coordinates.latitude, longitude: cafeData.coordinates.longitude, address: cafeData.location.display_address.joined(separator: " "))
    }
}
