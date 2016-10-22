//
//  WeatherVC.swift
//  RainyShinyCloudy
//
//  Created by Anton Novoselov on 19/10/2016.
//  Copyright © 2016 Anton Novoselov. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class WeatherVC: UIViewController {
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!

    var currentWeather: CurrentWeather!
    var forecast: Forecast!
    var forecasts = [Forecast]()
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    
    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startMonitoringSignificantLocationChanges()
        
        currentWeather = CurrentWeather()
        
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        locationAuthStatus()
    }
    
    
    
    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            
            currentLocation = locationManager.location
            
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longitude = currentLocation.coordinate.longitude
            
            currentWeather.downloadWeatherDetails {
                
                self.downloadForecastData {
                    
                    self.updateMainUI()
                }
                
            }

            
        } else {
            
            locationManager.requestWhenInUseAuthorization()
            locationAuthStatus()
        }
    }

    func updateMainUI() {
        
        dateLabel.text = currentWeather.date
        currentTempLabel.text = "\(currentWeather.currentTemp)"
        currentWeatherTypeLabel.text = currentWeather.weatherType
        locationLabel.text = currentWeather.cityName
        
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
        
    }
    
    func downloadForecastData(completed: @escaping DownloadComplete) {
        
        print("FORECAST_URL = " + FORECAST_URL)
        
        Alamofire.request(FORECAST_URL).responseJSON { response in
            
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    
                    for obj in list {
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
                        
//                        print(obj)
                    }
                    
                    self.forecasts.remove(at: 0)
                    self.tableView.reloadData()
                    
                }
                
            }
            
            completed()
        }
    }

    

}



// MARK: - UITableViewDataSource

extension WeatherVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as! WeatherCell
        
        
        let forecast = forecasts[indexPath.row]
        
        cell.configureCell(forecast: forecast)
        
        return cell
        
    }
    

}

// MARK: - UITableViewDelegate

extension WeatherVC: UITableViewDelegate {
    
}



extension WeatherVC: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        
        
    }
    
    
}















