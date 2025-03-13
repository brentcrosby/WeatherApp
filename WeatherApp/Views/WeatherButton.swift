//
//  WeatherButton.swift
//  WeatherApp
//
//  Created by Brent Crosby on 3/12/25.
//
import SwiftUI 

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .font(.system(size: 17, weight: .bold))
            .foregroundStyle(textColor)
            .cornerRadius(50)
    }
}
