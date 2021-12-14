//
//  CityViewModel.swift
//  ProximityAQI
//
//  Created by SYED FARAN GHANI on 13/12/21.
//

import Foundation

class CityViewModel{
    private let city: City!

    let name: String
    let aqi: Double
    let updatedDate: Date
    
    init(city: City) {
        self.city = city
        
        name = city.name ?? ""
        aqi = city.aqi ?? 0.0
        updatedDate = city.updatedDate ?? Date()

    }
}
