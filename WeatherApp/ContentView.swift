//
//  ContentView.swift
//  WeatherApp
//
//  Created by Brent Crosby on 3/3/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        WeatherDetail(viewModel: WeatherViewModel())
    }
}

#Preview {
    ContentView()
}
