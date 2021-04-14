//
//  TitleView.swift
//  Weather
//
//  Created by Scott Bolin on 06-A-21.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        Label(
            title: { Text("MobileWeather")},
            icon: {
                Image(systemName: "thermometer.sun.fill")
                    .renderingMode(.original)
            })
            .font(.largeTitle)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
