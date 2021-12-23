//
//  Constants.swift
//  weatherapp
//
//  Created by Ricardo Lucas on 23/12/2021.
//

import Foundation
import SwiftUI

struct Images{
    let sun: String = "sun.max"
    let cloud: String = "cloud"
    let rain: String = "cloud.rain"
    let storm: String = "cloud.bolt"
    
}

struct Constants {
    static let mainColor: Color = Color(hue: 0.677, saturation: 0.95, brightness: 0.87)
    static let secColor: Color = Color(.white)
    static let images:Images = Images()
}


