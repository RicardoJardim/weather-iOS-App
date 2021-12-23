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
                                        
                    VStack{
                        
                        HStack{
                            VStack(spacing:20){
                                Image(systemName: weather.weather[0].getImageWeather()).font(.system(size: 40 ))
                                
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
                    
                    
                }.frame(maxWidth:.infinity, alignment: .leading)
                
            }.padding().frame(maxWidth:.infinity, alignment: .leading)

            VStack{
                Spacer()

                VStack(alignment: .leading, spacing: 20){
                    Text("Weather now").font(.title).bold().padding(.bottom).foregroundColor(Constants.mainColor)
                    
                    HStack{
                        WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.tempMin.roundDouble() + "º") )
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "º") )
                        
                    }
                    
                    HStack{
                        WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + "m/s") )
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble()  + "%") )
                        
                    }
                }.frame(maxWidth: .infinity,alignment: .leading).padding().padding(.bottom, 20).foregroundColor(Constants.mainColor).background(Constants.secColor).cornerRadius(20,corners: [.topLeft,.topRight])
            }
        }.edgesIgnoringSafeArea(.bottom).background(Constants.mainColor).preferredColorScheme(.dark)
        
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
