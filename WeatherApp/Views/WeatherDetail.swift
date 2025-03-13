//
//  WeatherDetail.swift
//  WeatherApp
//
//  Created by Brent Crosby on 3/3/25.
//

import SwiftUI

struct WeatherDetail: View {
    
    @State private var isNight = false
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: .constant(viewModel.weatherData.current.isNight))
            VStack {
                CityTextView(cityName: viewModel.weatherData.current.cityName)
                MainWeatherStatusView(imageName: viewModel.weatherData.current.iconName,
                                      temperature: viewModel.weatherData.current.temperature)
                HStack(spacing: 16) {
                    ForEach(viewModel.weatherData.forecast, id: \.dayOfWeek) { forecast in
                        WeatherDayView(dayOfWeek: forecast.dayOfWeek,
                                       imageName: forecast.iconName,
                                       temperature: forecast.temperature)
                    }
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .black,
                                  backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    WeatherDetail(viewModel: WeatherViewModel())
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack (spacing: 3) {
            Text(dayOfWeek)
                .font(.system(size: 25, weight: .medium))
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 70)
            Text("\(temperature)°")
                .font(.system(size: 35, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(colors: [isNight ? .black : .blue,
                                isNight ? .gray : Color("lightBlue")],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 80, weight: .medium))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 40)
    }
}


