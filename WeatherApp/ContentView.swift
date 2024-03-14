//
//  ContentView.swift
//  WeatherApp
//
//  Created by Aministrador on 12/03/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            backgroundView(top: isNight ? .black: .blue, bottomtrailing: isNight ? .gray: Color("bluelight"))
            
        VStack{
            cityNameView(name: "São Paulo, Brasil", color: .white)
            
            dayNameView(dayName: "Terça-Feira 12 de Mar", color: .white)
            
            ImageNameView(imageName: isNight ? "moon.stars.fill": "cloud.sun.fill", temperature: isNight ? 18: 26)
        
            
            Spacer()
                               //MainPart
                        //-----------------------------//
            
            HStack(spacing: 15){
                daysOfWeekView(day: "Qua", imageName: isNight ? "wind": "cloud.sun.fill", temperature: isNight ? 16: 26)
                
                daysOfWeekView(day: "Qui", imageName:isNight ? "cloud.heavyrain.fill": "cloud.sun.bolt.fill", temperature:isNight ? 18: 24)
                
                daysOfWeekView(day: "Sex", imageName:isNight ? "cloud.moon.bolt.fill": "cloud.fill", temperature:isNight ? 15: 24)
                
                daysOfWeekView(day: "Sab", imageName:isNight ? "cloud.heavyrain.fill": "sun.max.fill", temperature:isNight ? 17: 27)
                
                daysOfWeekView(day: "Dom", imageName:isNight ? "moon.stars.fill": "sun.max.fill", temperature:isNight ? 19: 30)
                
                daysOfWeekView(day: "Seg", imageName:isNight ? "moon.stars.fill": "cloud.sun.bolt.fill", temperature:isNight ? 19: 31)
}
Spacer()
                               //DaysOfWeek
                          //--------------------------//
            Button{
                isNight.toggle()
            }label: {
                buttonView(nameButton: "Modo Noturno", background:isNight ? .black: .white, color: isNight ? .white: .blue)
       
            }
            
Spacer()

}
}
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct daysOfWeekView: View {
    
    var day: String
    var imageName: String
    var temperature: Int
    
    
    var body: some View {
        VStack{
            Text(day)
                .font(.system(size: 25, weight: .medium, design: .serif))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: 50, height: 50)
            
            Text("\(temperature)°")
                .font(.system(size: 30, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            
        }
    }
}

struct backgroundView: View {
    
    var top: Color
    var bottomtrailing: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [top, bottomtrailing]),
                       startPoint: .top, endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct cityNameView: View{
    
    var name: String
    var color: Color
    
    var body: some View{
         
        Text(name)
         .font(.system(size: 40, weight: .bold, design: .serif))
         .foregroundColor(color)
         .padding()

    }
}

struct dayNameView: View{
    
    var dayName: String
    var color: Color
    
    
    var body: some View{
        
        Text(dayName)
        .font(.system(size: 30, weight: .bold, design: .serif))
        .foregroundColor(color)
        .padding()
    }
}

struct ImageNameView: View{
    
    var imageName: String
    var temperature: Int
    
    var body: some View{
        
        Image(systemName: imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio( contentMode: .fit)
            .frame(width: 150, height: 150)
        
        Text("\(temperature)°C")
            .font(.system(size: 50, weight: .medium, design: .default))
            .foregroundColor(.white)
        
        
    }
}

struct buttonView: View{
    
    var nameButton: String
    var background: Color
    var color: Color
    
    
    var body: some View{
        
        Text(nameButton)
            .frame(width: 280, height: 50)
            .background(background)
            .foregroundColor(color)
            .font(.system(size: 35, weight: .bold, design: .serif))
           
          
        
    }
}
