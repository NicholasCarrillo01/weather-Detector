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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupUIWithData()
        
        let apiManager = APIManager()
        apiManager.geocode(address: "Louisville", onSuccess: { (geocodingData) in
            print(geocodingData.formattedAdress)
            print(geocodingData.latitude)
            print(geocodingData.longitude)
            
        }) { (error) in
        }
        
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
    
}

