//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Brent Crosby on 3/12/25.
//

import SwiftUI
import Combine

class WeatherViewModel: ObservableObject {
    @Published var weatherData: WeatherData
    
    init() {
        let fillerCurrent = CurrentWeather(cityName: "Sacramento, CA",
                                           temperature: 76,
                                           iconName: "sun.max.fill",
                                           isNight: false)
        let fillerForecasts = [
            ForecastDay(dayOfWeek: "MON", iconName: "cloud.sun.fill", temperature: 72),
            ForecastDay(dayOfWeek: "MON", iconName: "cloud.sun.fill", temperature: 72),
            ForecastDay(dayOfWeek: "MON", iconName: "cloud.sun.fill", temperature: 72),
            ForecastDay(dayOfWeek: "MON", iconName: "cloud.sun.fill", temperature: 72),
            ForecastDay(dayOfWeek: "MON", iconName: "cloud.sun.fill", temperature: 72)
        ]
        self.weatherData = WeatherData(current: fillerCurrent, forecast: fillerForecasts)
    }
}
