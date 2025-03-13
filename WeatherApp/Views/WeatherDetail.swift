//
//  WeatherDetail.swift
//  WeatherApp
//
//  Created by Brent Crosby on 3/3/25.
//

import SwiftUI

struct WeatherDetail: View {
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                Text("Sacramento, CA")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .padding()
                VStack(spacing: 10) {
                    Image(systemName: "sun.max.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    Text("76°")
                        .font(.system(size: 80, weight: .medium))
                        .foregroundStyle(.white)
                }
                .padding(.bottom, 40)
                
                HStack (spacing: 16){
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 72)
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 72)
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 72)
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 72)
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 72)
                    
                }
                Spacer()
                
                Button {
                    print("tapped")
                } label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font(.system(size: 17, weight: .bold))
                        .cornerRadius(50)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    WeatherDetail()
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
    var body: some View {
        LinearGradient(colors: [.blue, Color("lightBlue")],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)
    }
}
