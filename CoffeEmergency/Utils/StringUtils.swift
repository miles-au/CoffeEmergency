//
//  StringUtils.swift
//  CoffeEmergency
//
//  Created by Miles Au on 2020-08-14.
//  Copyright © 2020 Miles Au. All rights reserved.
//

import Foundation

class StringUtils{
    static func toSingleDecimal(_ num: Double) -> String {
        return "\(Double(round(10 * num)/10))"
    }
}
