//
//  Cities.swift
//  ProximityAQI
//
//  Created by SYED FARAN GHANI on 12/12/21.
//

import Foundation

struct Cities: Decodable {
    var data: CityResults
}

struct CityResults: Decodable {
    var results: [City]
}
