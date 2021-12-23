//
//  WeatherRow.swift
//  weatherapp
//
//  Created by Ricardo Lucas on 23/12/2021.
//

import SwiftUI

struct WeatherRow: View {
    
    var logo: String
    var name: String
    var value: String
    
    var body: some View {
        HStack(spacing:20){
            Image(systemName: logo)
                .font(.title2)
                .frame(width:20,height:20)
                .padding()
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.888))
                .cornerRadius(50)
            
            VStack(alignment:.leading, spacing: 8){
                Text(name)
                    .font(.caption).foregroundColor(Constants.mainColor)
                
                Text(value)
                    .bold()
                    .font(.title).foregroundColor(Constants.mainColor)
            }
        }
        
    }
}

struct WeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRow(logo:"thermometer",name:"Feels like", value:"8º")
    }
}
