//
//  ContentView.swift
//  test
//
//  Created by Yugandhar Khair on 9/22/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            backgroundView(isNight: isNight)
            VStack {
                CityNameView(cityName: "Santa Clara, CA ")
                
                MainWeatherView(weatherIcon: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                currTemp: isNight ? 61 : 78 )
                
                HStack(spacing:20){
                    WeatherDayView (dayOfWeek: "MON", imageName: "cloud.sun.fill", temperature: 74)
                    WeatherDayView (dayOfWeek: "TUE", imageName: "cloud.snow.fill", temperature: 69)
                    WeatherDayView (dayOfWeek: "WED", imageName: "sun.haze.fill", temperature: 73)
                    WeatherDayView (dayOfWeek: "THU", imageName: "thermometer.sun.fill", temperature: 79)
                    WeatherDayView (dayOfWeek: "FRI", imageName: "sun.max.fill", temperature: 77)
                }
                Spacer() 
                
                Button {
                    isNight.toggle()
                } label: {
                    weatherButtonView(buttonText: "Change Day Time", foregroundColor: .blue, bavkgroundColor: .white)
                }
                
                Spacer()
                
            }
        }
    }
}
 
#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.white)
        }
    }
}

struct backgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
//        LinearGradient(gradient:Gradient(colors: [isNight ? .black : .blue,
//                                         isNight ? .gray : Color("cyany")]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing )
//        .ignoresSafeArea()
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityNameView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherView: View {
    
    var weatherIcon: String
    var currTemp: Int
    
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: weatherIcon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(currTemp)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        
        .padding(.bottom, 40)
    }
}

