//
//  WeatherVC.swift
//  RainyShinyCloudy
//
//  Created by Anton Novoselov on 19/10/2016.
//  Copyright © 2016 Anton Novoselov. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController {
    
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    
    var currentWeather = CurrentWeather()
    
    
    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        currentWeather.downloadWeatherDetails { 
            // Setup UI to load downloaded data
            
            
            
            
        }
        
        
    }

    

}

// MARK: - UITableViewDataSource

extension WeatherVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        
        return cell
        
    }

}

// MARK: - UITableViewDelegate

extension WeatherVC: UITableViewDelegate {
    
}





