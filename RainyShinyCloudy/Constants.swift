//
//  Constants.swift
//  RainyShinyCloudy
//
//  Created by Anton Novoselov on 20/10/2016.
//  Copyright © 2016 Anton Novoselov. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "294c2bdc1cec983192f139eaf975b49a"

typealias DownloadComplete = () -> ()


let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)55.75\(LONGITUDE)37.62\(APP_ID)\(API_KEY)"

let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=55.75&lon=37.62&cnt=10&mode=json&appid=294c2bdc1cec983192f139eaf975b49a"


//let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=\(API_KEY)"
//let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=10&mode=json&appid=\(API_KEY)"

