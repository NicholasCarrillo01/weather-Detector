//
//  ViewController.swift
//  Weather Detector
//
//  Created by Nichilas Carrillo on 8/1/18.
//  Copyright © 2018 Nichilas Carrillo. All rights reserved.
//

import UIKit


class WeatherViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var iconLabel: UILabel!
    
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var highTemperatureLabel: UILabel!
    
    @IBOutlet weak var lowTemperatureLabel: UILabel!
    
    var weatherData: WeatherData! {
        didSet {
            iconLabel.text = weatherData.condition.icon
            currentTemperatureLabel.text = "\(weatherData.low)°"
            highTemperatureLabel.text = "\(weatherData.high)°"
            lowTemperatureLabel.text = "\(weatherData.low)°"
        }
    }
    var geocodingData: GeocodingData! {
        didSet {
            locationLabel.text = geocodingData.formattedAdress
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupUIWithData()
    }
    
    func setupUIWithData() {
        locationLabel.text = ""
        iconLabel.text = "☂️"
        currentTemperatureLabel.text = "Enter a location"
        highTemperatureLabel.text = "_"
        lowTemperatureLabel.text = "_"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func unwindTopMainScreen(segue: UIStoryboardSegue) {
        
    }
}

