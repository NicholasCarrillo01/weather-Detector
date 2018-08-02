//
//  LocationSelectViewController.swift
//  Weather Detector
//
//  Created by Nichilas Carrillo on 8/2/18.
//  Copyright © 2018 Nichilas Carrillo. All rights reserved.
//

import UIKit

class LocationSelectViewController: UIViewController, UISearchBarDelegate {
    
    let apiManager = APIManager()
    
    //variables to store retrieved  geocodingData and weatherData
    var geocodingData: GeocodingData?
    var weatherData: WeatherData?
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchAdress = searchBar.text?.replacingOccurrences(of: " ", with: "+")
            else {
                return
        }
        apiManager.geocode(address: searchAdress, onSuccess: onRetrieving(geocodingData:), onError: errorRetrieved(error:))
    }
    
    func errorRetrieved(error: Error) {
        //Clear out any data we've retrieved since there was an error
        geocodingData = nil
        weatherData = nil
        print(error)
    }
    
    func onRetrieving(geocodingData: GeocodingData) {
        self.geocodingData = geocodingData
        
        apiManager.getWeather(latitude: geocodingData.latitude, longitude: geocodingData.longitude, onSuccess: onRetrieving(weatherData:), onError: errorRetrieved(error:))
    }
    
    func onRetrieving(weatherData: WeatherData) {
        self.weatherData = weatherData
        
        self.performSegue(withIdentifier: "unwindToMainScreen", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        guard let destinationVC = segue.destination as? WeatherViewController, let retrievedGeocodingData = geocodingData, let retrievedWeatherData = weatherData else {
            
            return
        }
    
        destinationVC.geocodingData = retrievedGeocodingData
        destinationVC.weatherData = retrievedWeatherData
    }
   
    
}
