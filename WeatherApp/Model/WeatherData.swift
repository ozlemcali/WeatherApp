//
//  WeatherData.swift
//  WeatherApp
//
//  Created by ozlem on 22.12.2022.
//

import Foundation

struct WeatherData : Codable{
    let name: String
       let main: Main
       let weather: [Weather]
   }

struct Main: Codable {
       let temp: Double
   }

   struct Weather: Codable {
       let description: String
       let id: Int
   }
