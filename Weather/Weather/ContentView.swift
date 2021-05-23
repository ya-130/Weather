//
//  ContentView.swift
//  Weather
//
//  Created by Егор Яковин on 23.05.2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var weatherVM = WeatherViewModel()
    @State var city: String = ""
    
    var body: some View {
        VStack{
            TextField("Enter city", text:  $city, onEditingChanged: {_ in}, onCommit: {
                weatherVM.fetchweather(city: self.city)
            }).padding(.all, 15).font(.title)
            .border(Color.black, width: 2)
            .cornerRadius(5)
            Spacer()
            Text(city).font(.largeTitle).padding(.all, 50)
            Text("\(self.weatherVM.temperature) º").font(.largeTitle).padding(.all, 50)
            Text("Humidity: \(self.weatherVM.humidity) %").font(.largeTitle).padding(.all, 50)
            Text("Feels like \(self.weatherVM.feelslike) º").font(.largeTitle).padding(.all, 50)
        }.background(Color(#colorLiteral(red: 0.1074383631, green: 0.8437698483, blue: 1, alpha: 0.3264508929)).edgesIgnoringSafeArea(.all))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
