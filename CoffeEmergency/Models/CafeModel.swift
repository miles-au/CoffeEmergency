//
//  CafeModel.swift
//  CoffeEmergency
//
//  Created by Miles Au on 2020-08-13.
//  Copyright © 2020 Miles Au. All rights reserved.
//

import Foundation

struct CafeModel: Equatable{
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
        return CafeModel(
            name: cafeData.name,
            imageURL: cafeData.image_url,
            yelpURL: cafeData.url,
            open: !cafeData.is_closed,
            rating: cafeData.rating,
            price: cafeData.price,
            phone: cafeData.display_phone,
            distance: cafeData.distance,
            latitude: cafeData.coordinates.latitude,
            longitude: cafeData.coordinates.longitude,
            address: cafeData.location.display_address.joined(separator: " ")
        )
    }
}

extension CafeModel{
    static let tempShortData = [
        CafeModel(name: "Starbucks", imageURL: "https://s3-media4.fl.yelpcdn.com/bphoto/pj8sQK4rV-ePBf3bjIdJWw/o.jpg", yelpURL: "https://www.yelp.com/biz/starbucks-cupertino-21?adjust_creative=FWsxiO82XGlqf4jtJ9eo0g&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=FWsxiO82XGlqf4jtJ9eo0g", open: true, rating: 4.0, price: nil, phone: "(408) 253-0119", distance: 571.9820242893762, latitude: 37.336156, longitude: -122.034641, address: "20620 Homestead Rd Safeway Cupertino, CA 95014"),
        CafeModel(name: "Donut Wheel", imageURL: "https://s3-media2.fl.yelpcdn.com/bphoto/qV1o2GH9M5baLdvqb3h8XA/o.jpg", yelpURL: "https://www.yelp.com/biz/donut-wheel-cupertino?adjust_creative=FWsxiO82XGlqf4jtJ9eo0g&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=FWsxiO82XGlqf4jtJ9eo0g", open: true, rating: 4.0, price: Optional("$"), phone: "(408) 252-8193", distance: 605.8759339677605, latitude: 37.326383, longitude: -122.031939, address: "10250 N De Anza Blvd Cupertino, CA 95014"),
        CafeModel(name: "What8ver Express", imageURL: "https://s3-media2.fl.yelpcdn.com/bphoto/-QB7R0RHslW4FvjB5EvR8A/o.jpg", yelpURL: "https://www.yelp.com/biz/what8ver-express-cupertino-2?adjust_creative=FWsxiO82XGlqf4jtJ9eo0g&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=FWsxiO82XGlqf4jtJ9eo0g", open: true, rating: 3.0, price: Optional("$$"), phone: "(408) 873-0918", distance: 850.8148244032288, latitude: 37.324498742943, longitude: -122.03407823789, address: "10118 Bandley Dr Ste G Cupertino, CA 95014"),
        CafeModel(name: "RareTea", imageURL: "https://s3-media3.fl.yelpcdn.com/bphoto/0MAo_RGCdsF9xqJ7StrHHg/o.jpg", yelpURL: "https://www.yelp.com/biz/raretea-cupertino?adjust_creative=FWsxiO82XGlqf4jtJ9eo0g&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=FWsxiO82XGlqf4jtJ9eo0g", open: true, rating: 4.0, price: Optional("$"), phone: "(650) 772-2222", distance: 985.1998354547204, latitude: 37.336968, longitude: -122.0402513, address: "20956 Homestead Rd Ste D Cupertino, CA 95014"),
    ]
    
    static let tempData = [
        CafeModel(name: "Starbucks", imageURL: "https://s3-media4.fl.yelpcdn.com/bphoto/pj8sQK4rV-ePBf3bjIdJWw/o.jpg", yelpURL: "https://www.yelp.com/biz/starbucks-cupertino-21?adjust_creative=FWsxiO82XGlqf4jtJ9eo0g&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=FWsxiO82XGlqf4jtJ9eo0g", open: true, rating: 4.0, price: nil, phone: "(408) 253-0119", distance: 571.9820242893762, latitude: 37.336156, longitude: -122.034641, address: "20620 Homestead Rd Safeway Cupertino, CA 95014"),
        CafeModel(name: "Donut Wheel", imageURL: "https://s3-media2.fl.yelpcdn.com/bphoto/qV1o2GH9M5baLdvqb3h8XA/o.jpg", yelpURL: "https://www.yelp.com/biz/donut-wheel-cupertino?adjust_creative=FWsxiO82XGlqf4jtJ9eo0g&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=FWsxiO82XGlqf4jtJ9eo0g", open: true, rating: 4.0, price: Optional("$"), phone: "(408) 252-8193", distance: 605.8759339677605, latitude: 37.326383, longitude: -122.031939, address: "10250 N De Anza Blvd Cupertino, CA 95014"),
        CafeModel(name: "Starbucks", imageURL: "https://s3-media1.fl.yelpcdn.com/bphoto/c3Hio5o_LdrR_Hfbl4G5EQ/o.jpg", yelpURL: "https://www.yelp.com/biz/starbucks-cupertino-12?adjust_creative=FWsxiO82XGlqf4jtJ9eo0g&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=FWsxiO82XGlqf4jtJ9eo0g", open: true, rating: 3.0, price: Optional("$$"), phone: "(206) 379-3845", distance: 720.5200116140117, latitude: 37.336786, longitude: -122.036405, address: "20676 West Homestead Rd Cupertino, CA 95014"),
        CafeModel(name: "What8ver Express", imageURL: "https://s3-media2.fl.yelpcdn.com/bphoto/-QB7R0RHslW4FvjB5EvR8A/o.jpg", yelpURL: "https://www.yelp.com/biz/what8ver-express-cupertino-2?adjust_creative=FWsxiO82XGlqf4jtJ9eo0g&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=FWsxiO82XGlqf4jtJ9eo0g", open: true, rating: 3.0, price: Optional("$$"), phone: "(408) 873-0918", distance: 850.8148244032288, latitude: 37.324498742943, longitude: -122.03407823789, address: "10118 Bandley Dr Ste G Cupertino, CA 95014"),
        CafeModel(name: "Lee\'s Sandwiches", imageURL: "https://s3-media1.fl.yelpcdn.com/bphoto/Y3uMcVgSs_m2MOZtSA_FHg/o.jpg", yelpURL: "https://www.yelp.com/biz/lees-sandwiches-cupertino-2?adjust_creative=FWsxiO82XGlqf4jtJ9eo0g&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=FWsxiO82XGlqf4jtJ9eo0g", open: true, rating: 3.0, price: Optional("$"), phone: "(408) 446-5030", distance: 925.7225840244148, latitude: 37.323542551526, longitude: -122.02986670876, address: "20363 Stevens Creek Blvd Cupertino, CA 95014"),
        CafeModel(name: "La Terra Bakery & Cafe", imageURL: "https://s3-media3.fl.yelpcdn.com/bphoto/al6ADuhrw39_saoL8ubcxg/o.jpg", yelpURL: "https://www.yelp.com/biz/la-terra-bakery-and-cafe-cupertino?adjust_creative=FWsxiO82XGlqf4jtJ9eo0g&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=FWsxiO82XGlqf4jtJ9eo0g", open: true, rating: 4.0, price: Optional("$$"), phone: "(408) 366-2577", distance: 960.8752882960883, latitude: 37.3368620884625, longitude: -122.022391832245, address: "19960 Homestead Rd Cupertino, CA 95014"),
        CafeModel(name: "RareTea", imageURL: "https://s3-media3.fl.yelpcdn.com/bphoto/0MAo_RGCdsF9xqJ7StrHHg/o.jpg", yelpURL: "https://www.yelp.com/biz/raretea-cupertino?adjust_creative=FWsxiO82XGlqf4jtJ9eo0g&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=FWsxiO82XGlqf4jtJ9eo0g", open: true, rating: 4.0, price: Optional("$"), phone: "(650) 772-2222", distance: 985.1998354547204, latitude: 37.336968, longitude: -122.0402513, address: "20956 Homestead Rd Ste D Cupertino, CA 95014"),
        CafeModel(name: "Starbucks", imageURL: "https://s3-media2.fl.yelpcdn.com/bphoto/mNRgGipedVESN_AOrZ8Lpw/o.jpg", yelpURL: "https://www.yelp.com/biz/starbucks-cupertino-8?adjust_creative=FWsxiO82XGlqf4jtJ9eo0g&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=FWsxiO82XGlqf4jtJ9eo0g", open: true, rating: 2.5, price: Optional("$$"), phone: "(408) 725-2651", distance: 985.7235386917199, latitude: 37.323967, longitude: -122.03642, address: "20745 Stevens Creek Blvd Target Cupertino, CA 95014"),
        CafeModel(name: "Paris Baguette", imageURL: "https://s3-media3.fl.yelpcdn.com/bphoto/r6kmT7x0iGP-zOjxGEBq0w/o.jpg", yelpURL: "https://www.yelp.com/biz/paris-baguette-cupertino?adjust_creative=FWsxiO82XGlqf4jtJ9eo0g&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=FWsxiO82XGlqf4jtJ9eo0g", open: true, rating: 3.0, price: Optional("$$"), phone: "(408) 996-0704", distance: 999.4896489451023, latitude: 37.3234358747402, longitude: -122.03533988446, address: "20735 Stevens Creek Blvd Cupertino, CA 95014"),
        CafeModel(name: "Tea Era", imageURL: "https://s3-media4.fl.yelpcdn.com/bphoto/vc8nrgBN7lQgvoiEvIM6QQ/o.jpg", yelpURL: "https://www.yelp.com/biz/tea-era-cupertino?adjust_creative=FWsxiO82XGlqf4jtJ9eo0g&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=FWsxiO82XGlqf4jtJ9eo0g", open: true, rating: 3.5, price: Optional("$"), phone: "(408) 996-9898", distance: 1004.3604018592482, latitude: 37.3371504153713, longitude: -122.04035249287, address: "20916 Homestead Rd Ste F Cupertino, CA 95014"),
        CafeModel(name: "Le Boulanger", imageURL: "https://s3-media2.fl.yelpcdn.com/bphoto/Qg4HPW_kvqnzR-0lnZaB4A/o.jpg", yelpURL: "https://www.yelp.com/biz/le-boulanger-cupertino-3?adjust_creative=FWsxiO82XGlqf4jtJ9eo0g&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=FWsxiO82XGlqf4jtJ9eo0g", open: true, rating: 3.0, price: Optional("$"), phone: "(408) 446-5151", distance: 1028.8753047067898, latitude: 37.3225470924947, longitude: -122.031204429147, address: "20488 Stevens Creek Blvd Cupertino, CA 95014"),
        CafeModel(name: "McDonald\'s", imageURL: "https://s3-media4.fl.yelpcdn.com/bphoto/69XVXy4RqUDmRY_GoN6yyg/o.jpg", yelpURL: "https://www.yelp.com/biz/mcdonalds-cupertino-2?adjust_creative=FWsxiO82XGlqf4jtJ9eo0g&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=FWsxiO82XGlqf4jtJ9eo0g", open: true, rating: 2.5, price: Optional("$"), phone: "(408) 255-7576", distance: 1052.3792175406031, latitude: 37.3372, longitude: -122.04099, address: "10990 N Stelling Rd Cupertino, CA 95014"),
        CafeModel(name: "Philz Coffee - De Anza", imageURL: "https://s3-media2.fl.yelpcdn.com/bphoto/spenv5PACcod_SFarF4jUA/o.jpg", yelpURL: "https://www.yelp.com/biz/philz-coffee-de-anza-cupertino-2?adjust_creative=FWsxiO82XGlqf4jtJ9eo0g&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=FWsxiO82XGlqf4jtJ9eo0g", open: true, rating: 4.5, price: Optional("$"), phone: "(408) 446-9000", distance: 1081.1027943352692, latitude: 37.3224764649389, longitude: -122.034667027534, address: "20686 Stevens Creek Blvd Cupertino, CA 95014"),
        CafeModel(name: "Starbucks Reserve", imageURL: "https://s3-media1.fl.yelpcdn.com/bphoto/BORxlCbP2zmKsoPFnAwJrA/o.jpg", yelpURL: "https://www.yelp.com/biz/starbucks-reserve-cupertino?adjust_creative=FWsxiO82XGlqf4jtJ9eo0g&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=FWsxiO82XGlqf4jtJ9eo0g", open: true, rating: 3.5, price: Optional("$"), phone: "(408) 973-8358", distance: 1132.8963888877654, latitude: 37.3220155, longitude: -122.0329105, address: "20520A Stevens Creek Blvd Cupertino, CA 95014"),
        CafeModel(name: "Gong Cha", imageURL: "https://s3-media3.fl.yelpcdn.com/bphoto/Fxh3Y_JUwPKemNqxIhnsRA/o.jpg", yelpURL: "https://www.yelp.com/biz/gong-cha-sunnyvale?adjust_creative=FWsxiO82XGlqf4jtJ9eo0g&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=FWsxiO82XGlqf4jtJ9eo0g", open: true, rating: 4.0, price: Optional("$"), phone: "(408) 685-2991", distance: 1337.4345287091412, latitude: 37.33929, longitude: -122.04255, address: "1641 Hollenbeck Ave Sunnyvale, CA 94087"),
        CafeModel(name: "7-Eleven", imageURL: "https://s3-media4.fl.yelpcdn.com/bphoto/P-n7OE44-m2XAU9ool3rsA/o.jpg", yelpURL: "https://www.yelp.com/biz/7-eleven-cupertino-4?adjust_creative=FWsxiO82XGlqf4jtJ9eo0g&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=FWsxiO82XGlqf4jtJ9eo0g", open: true, rating: 3.0, price: Optional("$"), phone: "(408) 735-8004", distance: 1359.11727453922, latitude: 37.3371479637609, longitude: -122.04502299428, address: "21220 Homestead Rd Cupertino, CA 95014"),
        CafeModel(name: "Fantasia Coffee & Tea", imageURL: "https://s3-media3.fl.yelpcdn.com/bphoto/L4JseB90MMQw6gY4BkU8cg/o.jpg", yelpURL: "https://www.yelp.com/biz/fantasia-coffee-and-tea-cupertino?adjust_creative=FWsxiO82XGlqf4jtJ9eo0g&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=FWsxiO82XGlqf4jtJ9eo0g", open: true, rating: 4.0, price: Optional("$"), phone: "(408) 865-1689", distance: 1436.1272854563756, latitude: 37.3361159244324, longitude: -122.015890307529, address: "10933 N Wolfe Rd Cupertino, CA 95014"),
        CafeModel(name: "Ume Tea", imageURL: "https://s3-media4.fl.yelpcdn.com/bphoto/uq8oCC5_pqSugZoZs8gzuQ/o.jpg", yelpURL: "https://www.yelp.com/biz/ume-tea-cupertino-2?adjust_creative=FWsxiO82XGlqf4jtJ9eo0g&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=FWsxiO82XGlqf4jtJ9eo0g", open: true, rating: 4.0, price: Optional("$$"), phone: "(408) 638-7457", distance: 1442.7118144351266, latitude: 37.335783, longitude: -122.01567, address: "10887 N Wolfe Rd Cupertino, CA 95014"),
        CafeModel(name: "Bitter+Sweet", imageURL: "https://s3-media3.fl.yelpcdn.com/bphoto/iOKCfa5Q2nlB9Ao2fcqL5Q/o.jpg", yelpURL: "https://www.yelp.com/biz/bitter-sweet-cupertino?adjust_creative=FWsxiO82XGlqf4jtJ9eo0g&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=FWsxiO82XGlqf4jtJ9eo0g", open: true, rating: 4.0, price: Optional("$$"), phone: "(408) 255-2600", distance: 1516.5306282171218, latitude: 37.3181638185566, longitude: -122.03151641898, address: "20560 Town Center Ln Cupertino, CA 95014"),
        CafeModel(name: "Coffee Society", imageURL: "https://s3-media2.fl.yelpcdn.com/bphoto/tr8QoNEeDcgGXW5P-L2IWQ/o.jpg", yelpURL: "https://www.yelp.com/biz/coffee-society-cupertino-6?adjust_creative=FWsxiO82XGlqf4jtJ9eo0g&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=FWsxiO82XGlqf4jtJ9eo0g", open: true, rating: 3.5, price: Optional("$"), phone: "(408) 996-2105", distance: 1540.4092809928331, latitude: 37.3180675843129, longitude: -122.028904099137, address: "10300 Torre Ave Cupertino, CA 95014"),
    ]
}
