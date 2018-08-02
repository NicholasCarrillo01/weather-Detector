//
//  APIManager.swift
//  Weather Detector
//
//  Created by Nichilas Carrillo on 8/1/18.
//  Copyright © 2018 Nichilas Carrillo. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIManager {
    //intance of our api keys struct, which stores our api keys
    let apiKeys = APIKeys()
    
    //base URL for the Google geocoding API
    let gooogleBaseURL = "https://maps.googleapis.com/maps/api/geocode/json?address="
    
    let darkSkyBaseURL = "https://api.darksky.net/forecast/"
    
    enum APIError: Error {
        case noData
        case noResponse
        case invalidData
    }
    func geocode(address: String, onSuccess: @escaping (GeocodingData) -> Void, onError: @escaping (Error) -> Void) {
        let url = "\(gooogleBaseURL)\(address)\(apiKeys.googleKey)"
        
        Alamofire.request(url).responseJSON { response in
            print(response)
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                guard let geocodingData = GeocodingData(json: json) else {
                    onError(APIError.invalidData)
                    return
                }
                
                onSuccess(geocodingData)
            case .failure(let error):
                onError(error)
            }
        }
    }
    func getWeather(latitude: Double, longitude: Double, onSuccess: @escaping  (WeatherData) -> Void, onError: @escaping (Error) -> Void) {
        //https://api.darksky.net/forecast/[API Key]/
        let url = "\(darkSkyBaseURL)\(apiKeys.darkSkyKey)/\(latitude),\(longitude)"
        
        Alamofire.request(url).responseJSON { response in
            print(response)
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                guard let weatherData = WeatherData(json: json) else {
                    onError(APIError.invalidData)
                    return
                }
                onSuccess(weatherData)
            case .failure(let error):
                onError(error)
            }
        }
    }

}













