//
//  WeatherData.swift
//  Weather Detector
//
//  Created by Nichilas Carrillo on 8/2/18.
//  Copyright © 2018 Nichilas Carrillo. All rights reserved.
//

import Foundation
import SwiftyJSON

class WeatherData {
    //Current temperature, high temperature, low temperature, condition
    enum Condition: String {
        case clearDay = "clear-day"
        case clearNight = "clear-night"
        case rain = "rain"
        case snow = "snow"
        case sleet = "sleet"
        case wind = "wind"
        case fog = "fog"
        case cloudy = "cloudy"
        case partlyCloudyDay = "partly-cloudy-day"
        case partlyCloudyNight = "partly-cloudy-night"
        
        init?(string: String?) {
            guard let string = string else {
                return nil
            }
            
            self.init(rawValue: string)
            
        }
        
        var icon: String {
            switch self {
            case .clearDay:
                return "☀️"
            case .clearNight:
                return "🌛"
            case .rain:
                return "🌧"
            case .snow, .sleet:
                return "🌨"
            case .wind:
                return "💨"
            case .fog:
                return "🌫"
            case .cloudy:
                return "☁️"
            case .partlyCloudyDay:
                return "🌤"
            case .partlyCloudyNight:
                return "🌤"
                
                
                
            }
        }
    }
    let temperature: Double
    let condition: Condition
    let high: Double
    let low: Double
    
    init(temperature: Double, condition: Condition, high: Double, low: Double) {
        self.temperature = temperature
        self.condition = condition
        self.high = high
        self.low = low
    }
    enum WeatherDataKeys: String {
        case currently = "currently"
        case daily = "daily"
        case data = "data"
        case temperature = "apparentTemperature"
        case condition = "icon"
        case high = "apparentTemperatureMax"
        case low = "apparentTemperatureMin"
    }
    convenience init?(json: JSON) {
        guard
            let temperature = json[WeatherDataKeys.currently.rawValue][WeatherDataKeys.temperature.rawValue].double,
            let condition = Condition(string: json[WeatherDataKeys.currently.rawValue][WeatherDataKeys.condition.rawValue].string),
            let high = json[WeatherDataKeys.daily.rawValue][WeatherDataKeys.data.rawValue][0][WeatherDataKeys.high.rawValue].double,
            let low = json[WeatherDataKeys.daily.rawValue][WeatherDataKeys.data.rawValue][0][WeatherDataKeys.low.rawValue].double
            else { return nil }
        
        self.init(temperature: temperature, condition: condition, high: high, low: low)
    }

}







