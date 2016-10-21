//
//  Forecast.swift
//  RainyShinyCloudy
//
//  Created by Anton Novoselov on 21/10/2016.
//  Copyright © 2016 Anton Novoselov. All rights reserved.
//

import UIKit
import Alamofire


class Forecast {
    
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    var date: String {
        
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp: String {
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    var lowTemp: String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }

    
    init(weatherDict: Dictionary<String, AnyObject>) {
        
        if let tempDict = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            
            
            if let tempMax = tempDict["max"] as? Double {
                
                let kelvinToCelcius = tempMax - 273.15
                self._highTemp = "\(round(10*kelvinToCelcius)/10)"
                
                print("self._highTemp = " + self.highTemp)
            }
            
            if let tempMin = tempDict["min"] as? Double {
                
                let kelvinToCelcius = tempMin - 273.15
                self._lowTemp = "\(round(10*kelvinToCelcius)/10)"
                
                print("self._lowTemp = " + self.lowTemp)
            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            
            if let main = weather[0]["main"] as? String {
                
                self._weatherType = main.capitalized
                print("self._weatherType = " + self._weatherType)
            }
        }
        
        
        if let date = weatherDict["dt"] as? Double {
            
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateStyle = .full
//            dateFormatter.dateFormat = "EEEE"
//            dateFormatter.timeStyle = .none
            
            self._date = unixConvertedDate.dayOfTheWeek()
            
        }
        
        
    }
    
    
    
    
    
    
    
}


// ===TOUSE===

extension Date {
    func dayOfTheWeek() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        
        return dateFormatter.string(from: self)
        
    }
}






















