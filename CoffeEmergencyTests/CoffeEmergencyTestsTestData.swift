//
//  CoffeEmergencyTestsTestData.swift
//  CoffeEmergencyTests
//
//  Created by Miles Au on 2020-08-16.
//  Copyright © 2020 Miles Au. All rights reserved.
//

import Foundation
@testable import CoffeEmergency

class CoffeEmergencyTestsTestData{
    static let firstCafeModel = CafeModel(
        name: "RareTea",
        imageURL: "https://s3-media3.fl.yelpcdn.com/bphoto/0MAo_RGCdsF9xqJ7StrHHg/o.jpg",
        yelpURL: "https://www.yelp.com/biz/raretea-cupertino?adjust_creative=FWsxiO82XGlqf4jtJ9eo0g&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=FWsxiO82XGlqf4jtJ9eo0g",
        open: true,
        rating: 4.0,
        price: "$",
        phone: "(650) 772-2222",
        distance: 8.946362731429797,
        latitude: 37.336968,
        longitude: -122.0402513,
        address: "20956 Homestead Rd Ste D Cupertino, CA 95014")
    
    static let tempJSONString: String = {
        if let path = Bundle.main.path(forResource: "apiData", ofType: "json"), let text = try? String(contentsOfFile: path, encoding: .utf8){
            return text
        }
        return "failed to parse json file."
    }()
    
    static let firstCafeData: Business = {
        let location = Location(
                address1: "20956 Homestead Rd",
                address2: "Ste D",
                address3: "",
                city: "Cupertino",
                zip_code: "95014",
                country: "US",
                state: "CA",
                display_address: [
                           "20956 Homestead Rd",
                           "Ste D",
                           "Cupertino, CA 95014"
                       ])
        
        let coordinates = Coordinates(latitude: 37.336968, longitude: -122.0402513)
        
        let business = Business(
                name: "RareTea",
                image_url: "https://s3-media3.fl.yelpcdn.com/bphoto/0MAo_RGCdsF9xqJ7StrHHg/o.jpg",
                url: "https://www.yelp.com/biz/raretea-cupertino?adjust_creative=FWsxiO82XGlqf4jtJ9eo0g&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=FWsxiO82XGlqf4jtJ9eo0g",
                is_closed: false,
                rating: 4.0,
                coordinates: coordinates,
                price: "$",
                location: location,
                display_phone: "(650) 772-2222",
                distance: 8.946362731429797)
        
        return business
    }()
}
