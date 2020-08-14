//
//  UIImage+Extensions.swift
//  CoffeEmergency
//
//  Created by Miles Au on 2020-08-14.
//  Copyright © 2020 Miles Au. All rights reserved.
//

import UIKit

extension UIImage{
    static func downloaded(from url: URL, completion: @escaping (UIImage) -> Void){
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else {
                    // TODO: Placeholder image on fail
                    return
            }
            
            completion(image)
        }.resume()
    }
}
