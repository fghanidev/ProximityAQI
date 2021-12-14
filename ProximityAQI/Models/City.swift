//
//  Conversion.swift
//  ProximityAQI
//
//  Created by SYED FARAN GHANI on 12/12/21.
//


import Foundation


public class City: Codable {
    public var name: String?
    public var aqi: Double?
    public var updatedDate = Date()

    
    enum CodingKeys: String, CodingKey {
        case name = "city"
        case aqi = "aqi"
//        case updatedDate = "updatedDate"
    }
   
    required public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let name = try container.decodeIfPresent(String.self, forKey: .name)
        let aqi = try container.decodeIfPresent(Double.self, forKey: .aqi)

        
        self.name = name
        self.aqi = aqi
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

    }
}
