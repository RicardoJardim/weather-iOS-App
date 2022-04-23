//
//  WeatherService.swift
//  weatherapp
//
//  Created by Ricardo Lucas on 12/12/2021.
//

import Foundation
import CoreLocation

class WeatherService{
    
    func getCurrentWeather(latitude:CLLocationDegrees, longitude:CLLocationDegrees) async throws -> ResponseBody{
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=&units=metric") else{ fatalError("Missing URL")}
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
   

        // Return if response istn HTTPURLResponde
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("API DOWN")}
        
        let DecodeData = try JSONDecoder().decode(ResponseBody.self,  from:data)
        return DecodeData
    }
    
}



struct ResponseBody: Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var wind: WindResponse
    var name: String

    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }

    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
        
    }

    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
    
    
}

extension ResponseBody.WeatherResponse{
    func getImageWeather() -> String{
        switch main{
            case "Sun":
                return Constants.images.sun
            case "Clouds":
                return Constants.images.cloud
            case "Rain":
                return Constants.images.rain
            default:
                return ""
        }
    }
}

extension ResponseBody.MainResponse {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}
