//
//  WeatherView.swift
//  weatherapp
//
//  Created by Ricardo Lucas on 12/12/2021.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    var body: some View {
        ZStack(alignment: .leading){
            
            VStack{
                
                VStack(alignment: .leading, spacing: 5){
                    
                    Text(weather.name).bold().font( .title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))").fontWeight(.light)
                    
                    Spacer()
                    
                    VStack{
                        
                        HStack{
                            VStack(spacing:20){
                                Image(systemName: "sun.max").font(.system(size: 40 ))
                                
                                Text(weather.weather[0].main)
                            }.frame(width:  150, alignment: .leading)
                            
                            Spacer()
                            Text(weather.main.feels_like.roundDouble() + "º").font( .system(size:100)).fontWeight(.bold).padding()
                        }
                    }.frame(maxWidth:.infinity )
                    
                    Spacer().frame(height:80)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()

                    
                }.frame(maxWidth:.infinity)
                
            }.padding().frame(maxWidth:.infinity, alignment: .leading)
            
        }.edgesIgnoringSafeArea(.bottom).background(Color(hue: 0.677, saturation: 0.95, brightness: 0.837)).preferredColorScheme(.dark)
        
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
