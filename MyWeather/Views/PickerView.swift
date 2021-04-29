//
//  PickerView.swift
//  Weather
//
//  Created by Scott Bolin on 05-A-21.
//

import SwiftUI

struct PickerView: View {
    @StateObject var forecastListVM = ForecastViewModel()
    
    init() {
        //this changes the "thumb" that selects between items
        UISegmentedControl.appearance().selectedSegmentTintColor = .white
        //and this changes the color for the whole "bar" background
        UISegmentedControl.appearance().backgroundColor = .systemGray5
        
        //this will change the font size
//        UISegmentedControl.appearance().setTitleTextAttributes([.font : UIFont.preferredFont(forTextStyle: .largeTitle)], for: .normal)
        
        //these lines change the text color for various states
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.red], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.blue], for: .normal)
    }
    
    var body: some View {
        Picker(selection: $forecastListVM.system, label: Text("Units")) {
            Text("°C").tag(0)
            Text("°F").tag(1)
        }
        .pickerStyle(SegmentedPickerStyle())
        .frame(width: 150)
        .padding(.bottom, 4)
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}




