//
//  WeatherIconView.swift
//  Weather
//
//  Created by Scott Bolin on 06-A-21.
//

import SwiftUI

struct WeatherIconView: View {
    
    @ObservedObject var imageLoader = ImageLoader()
    let imageURL: URL
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color.blue.opacity(0.5))
                .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            if self.imageLoader.image != nil {
                    Image(uiImage: self.imageLoader.image!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 75)

            } else {
                Image(systemName: "hourglass")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
            }
        }
        .onAppear {
            self.imageLoader.loadImage(with: self.imageURL)
        }
    }
}

struct WeatherIconView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherIconView(imageURL: URL(string: "http://openweathermap.org/img/wn/10d@2x.png")!)
    }
}
