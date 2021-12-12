//
//  ContentView.swift
//  weather
//
//  Created by Ricardo Lucas on 11/12/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationService = LocationService()
    var weatherService = WeatherService()
    @State var weather: ResponseBody?
    var body: some View {
        VStack{
            
            if let location = locationService.location{
                if let weather = weather {
                    WeatherView(weather: weather)
                }else{
                    LoadingView().task{
                        do{
                           weather =   try await weatherService.getCurrentWeather(latitude:  location.longitude, longitude: location.longitude)
                        }catch{
                            print("Error getting data")
                        }
                    }
                }
            }else{
                if locationService.isLoading {
                    LoadingView()
                }else{
                    WelcomeView().environmentObject(locationService)

                }
            }
            
        }.background(Color(hue: 0.677, saturation: 0.95, brightness: 0.837)).preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
