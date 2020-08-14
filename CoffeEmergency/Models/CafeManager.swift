//
//  CafeManager.swift
//  CoffeEmergency
//
//  Created by Miles Au on 2020-08-13.
//  Copyright © 2020 Miles Au. All rights reserved.
//

import Foundation

protocol CafeManagerDelegate{
    func didFetchCafes(with: Result<[CafeModel], Error>)
}

class CafeManager{
    let baseURL = "https://api.yelp.com/v3/businesses/search?limit=50&term=coffee&sort_by=distance&open_now=true"
    var delegate: CafeManagerDelegate?
    
    func fetchCafes(at latitude: Double, and longitude: Double){
        guard let url = URL(string: "\(baseURL)&latitude=\(latitude)&longitude=\(longitude)") else {
            self.delegate?.didFetchCafes(with: .failure(NSError(domain: "Sorry, something went wrong.", code: 500, userInfo: nil)))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("Bearer \(Secrets.YelpAPIKey)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error{
                self.delegate?.didFetchCafes(with: .failure(error))
            }
            
            if let data = data{
                self.delegate?.didFetchCafes(with: self.parse(json: data))
            }
        }.resume()
    }
    
    func parse(json: Data) -> Result<[CafeModel], Error>{
        do{
            let decodedData = try JSONDecoder().decode(CafeData.self, from: json)
            let cafes: [CafeModel] = decodedData.businesses.map { cafeItem in
                return CafeModel.from(cafeData: cafeItem)
            }
            
            return .success(cafes)
        }catch{
            print("Error fetching cafes: \(error)")
            return .failure(error)
        }
    }
    
}
