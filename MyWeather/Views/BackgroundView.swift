//
//  BackgroundView.swift
//  Weather
//
//  Created by Scott Bolin on 05-A-21.
//

import SwiftUI

struct BackgroundView: View {
    @Environment(\.colorScheme) var colorScheme
    var isNight: Bool = false
    let opacity: Double = 0.3
    var body: some View {
        
        let isNight = (colorScheme == .dark)
        
        let firstDark = Color(.black).opacity(opacity)
        let lastDark = Color(.gray).opacity(opacity)

        let firstLight = Color(.blue).opacity(opacity)
        let lastLight = Color("lightBlue").opacity(opacity)
        
        LinearGradient(gradient: Gradient(
                        colors: [isNight ? firstDark : firstLight, isNight ? lastDark : lastLight]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
