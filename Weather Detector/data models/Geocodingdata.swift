//
//  Geocodingdata.swift
//  Weather Detector
//
//  Created by Nichilas Carrillo on 8/1/18.
//  Copyright © 2018 Nichilas Carrillo. All rights reserved.
//

import Foundation
import SwiftyJSON

class GeocodingData {
    
    enum GeocodingDataKeys: String {
        case results = "results"
        case formattedAddress = "formatted_address"
        case geometry = "geometry"
        case location = "location"
        case lat = "lat"
        case lng = "lng"
    }
    
    
    var formattedAdress: String
    var latitude: Double
    var longitude: Double
    
    init(formattedAdress: String, latitude: Double, longitude: Double) {
        self.formattedAdress = formattedAdress
        self.latitude = latitude
        self.longitude = longitude
    }
    
    convenience init?(json: JSON) {
        guard let results = json[GeocodingDataKeys.results.rawValue].array?[0],
            let formattedAddress = results[GeocodingDataKeys.formattedAddress.rawValue].string, let latitude = results[GeocodingDataKeys.geometry.rawValue][GeocodingDataKeys.location.rawValue][GeocodingDataKeys.lat.rawValue].double, let longitude = results[GeocodingDataKeys.geometry.rawValue][GeocodingDataKeys.location.rawValue][GeocodingDataKeys.lng.rawValue].double else {
                return nil
        }
        self.init(formattedAdress: formattedAddress, latitude: latitude, longitude: longitude)
    
    }
}





