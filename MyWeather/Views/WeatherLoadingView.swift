//
//  WeatherLoadingView.swift
//  Weather
//
//  Created by Scott Bolin on 05-A-21.
//

import SwiftUI

struct WeatherLoadingView: View {
    var body: some View {
        ZStack {
        Color(.white)
            .opacity(0.5)
            .blur(radius: 3.0)
        ProgressView("Fetching Weather")
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(.white))
            )
            .shadow(radius: 6)
        }
        .ignoresSafeArea()

    }
}

struct WeatherLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherLoadingView()
    }
}
