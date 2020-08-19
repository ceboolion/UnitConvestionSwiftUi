//
//  ContentView.swift
//  UnitConversion
//
//  Created by Ceboolion on 19/08/2020.
//  Copyright © 2020 Ceboolion. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var unit = "0"
    @State private var unitToChoose = 1
    @State private var calculatedTemperature: Double?
    
    let temperatureIn = ["Celsius", "Fahrenheit", "Kelvin"]
    let temperatureUnits = [1.0, 0.0, 293.15]
    
    var temperatureConversion: Double {
        let enteredTemperature = Double(unit) ?? 0.0
        var result = 0.0
        if unitToChoose == 0 {
            result = enteredTemperature * temperatureUnits[0]
        } else if unitToChoose == 1 {
            result = enteredTemperature * 9.0 / 5.0 + 32.0
        } else {
            result = enteredTemperature + temperatureUnits[2]
        }
        return result
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Enter number", text: $unit)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("Choose conversion")) {
                    Picker("Choose unit", selection: $unitToChoose){
                        ForEach(0 ..< temperatureIn.count) {
                            Text("\(self.temperatureIn[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Celsius to \(temperatureIn[unitToChoose])")){
                    Text("\(temperatureConversion, specifier: "%.1f")")
                }
            }
            .navigationBarTitle("Unit Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
