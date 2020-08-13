//
//  CafeData.swift
//  CoffeEmergency
//
//  Created by Miles Au on 2020-08-13.
//  Copyright © 2020 Miles Au. All rights reserved.
//

import Foundation

struct CafeData: Decodable{
    let businesses: [Business]
}

struct Business: Decodable{
    let name: String
    let image_url: String
    let url: String // link to yelp page
    let is_closed: Bool
    let rating: Double
    let coordinates: Coordinates
    let price: String?
    let location: Location
    let display_phone: String // phone number is display friendly format
    let distance: Double
}

struct Coordinates: Decodable{
    let latitude: Double
    let longitude: Double
}

struct Location: Decodable{
    let address1: String
    let address2: String?
    let address3: String?
    let city: String
    let zip_code: String
    let country: String
    let state: String
    let display_address: [String]
}
