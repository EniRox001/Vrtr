//
//  ContentView.swift
//  Vrtr
//
//  Created by Ehnamuram Enoch on 08/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedGlobalUnit: String = "Temperature"
    @State private var unitField = 0.0
    
    // Units for respective unit selected
    @State private var temperatureUnits: [String] = ["Celsius", "Fahrenheit", "Kelvin"]
    @State private var lengthUnits: [String] = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
    @State private var timeUnits: [String] = ["Seconds", "Minutes", "Hours", "Days"]
    @State private var volumeUnits: [String] = ["Milliliters", "Liters", "Cups", "Pints", "Gallons"]
    
    @State private var fromUnit: String = "Celsius"
    @State private var toUnit: String = "Fahrenheit"
    
    
    var units: [String] = ["Temperature", "Length", "Time", "Volume"]
    
        var currentUnit: [String] {
        switch selectedGlobalUnit {
        case "Length":
            return lengthUnits
        case "Time":
            return timeUnits
        case "Volume":
            return volumeUnits
        default:
            return temperatureUnits
        }
    }
    
    var output: Double {
        
        switch fromUnit {
        //Temperature Logic
        case "Celsius":
            switch toUnit {
            case "Fahrenheit":
                return (unitField * 9/5) + 32
            case "Kelvin":
                return unitField + 273.15
            default:
                return unitField
            }
        case "Fahrenheit":
            switch toUnit {
            case "Celsius":
                return (unitField - 32) * (5/9)
            case "Kelvin":
                return (unitField - 32) * 5 / 9 + 273.15
            default:
                return unitField
            }
        case "Kelvin":
            switch toUnit {
            case "Celsius":
                return unitField - 273.15
            case "Fahrenheit":
                return (unitField - 273.15) * 1.8 + 32
            default:
                return unitField
            }
        
        // Length Logic
        case "Meters":
            switch toUnit {
            case "Kilometers":
                return unitField / 1000
            case "Feet":
                return unitField * 3.281
            case "Yards":
                return unitField * 1.094
            case "Miles":
                return unitField / 1609
            default:
                return unitField
            }
        case "Kilometers":
            switch toUnit {
            case "Meters":
                return unitField * 1000
            case "Feet":
                return unitField * 3281
            case "Yards":
                return unitField * 1094
            case "Miles":
                return unitField / 1.609
            default:
                return unitField
            }
        case "Feet":
            switch toUnit {
            case "Meters":
                return unitField / 3.281
            case "Kilometers":
                return unitField / 3281
            case "Yards":
                return unitField / 3
            case "Miles":
                return unitField / 5280
            default:
                return unitField
            }
        case "Yards":
            switch toUnit {
            case "Meters":
                return unitField / 1.094
            case "Kilometers":
                return unitField / 1094
            case "Feet":
                return unitField * 3
            case "Miles":
                return unitField / 1760
            default:
                return unitField
            }
        case "Miles":
            switch toUnit {
            case "Meters":
                return unitField * 1609
            case "Kilometers":
                return unitField * 1.609
            case "Feet":
                return unitField * 5280
            case "Yards":
                return unitField * 1760
            default:
                return unitField
            }
            
        //Time Logic
        case "Seconds":
            switch toUnit {
            case "Minutes":
                return unitField / 60
            case "Hours":
                return unitField / 3600
            case "Days":
                return unitField / 86400
            default:
                return unitField
            }
        case "Minutes":
            switch toUnit {
            case "Seconds":
                return unitField * 60
            case "Hours":
                return unitField / 60
            case "Days":
                return unitField / 1440
            default:
                return unitField
            }
        case "Hours":
            switch toUnit {
            case "Seconds":
                return unitField * 3600
            case "Minutes":
                return unitField * 60
            case "Days":
                return unitField / 24
            default:
                return unitField
            }
        case "Days":
            switch toUnit {
            case "Seconds":
                return unitField * 86400
            case "Minutes":
                return unitField * 1440
            case "Hours":
                return unitField * 24
            default:
                return unitField
            }
            
        //["Milliliters", "Liters", "Cups", "Pints", "Gallons"]
        //Volume Logic
        case "Milliliters":
            switch toUnit {
            case "Liters":
                return unitField / 1000
            case "Cups":
                return unitField / 237
            case "Pints":
                return unitField * 0.002113
            case "Gallons":
                return unitField * 0.000264
            default:
                return unitField
            }
        case "Liters":
            switch toUnit {
            case "Milliliters":
                return unitField * 1000
            case "Cups":
                return unitField * 4.22675
            case "Pints":
                return unitField * 2.113376
            case "Gallons":
                return unitField * 0.264172
            default:
                return unitField
            }
        case "Cups":
            switch toUnit {
            case "Milliliters":
                return unitField * 237
            case "Liters":
                return unitField * 0.236588
            case "Pints":
                return unitField / 2
            case "Gallons":
                return unitField / 16
            default:
                return unitField
            }
        case "Pints":
            switch toUnit {
            case "Milliliters":
                return unitField * 473.176473
            case "Liters":
                return unitField * 0.473176
            case "Cups":
                return unitField * 2
            case "Gallons":
                return unitField / 8
            default:
                return unitField
            }
        case "Gallons":
            switch toUnit {
            case "Milliliters":
                return unitField * 3785.411784
            case "Liters":
                return unitField * 3.785411784
            case "Cups":
                return unitField * 16
            case "Pints":
                return unitField * 8
            default:
                return unitField
            }
        default:
            return unitField
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Select Unit") {
                    HStack {
                        TextField("Enter Unit", value: $unitField, format: .number)
                        Picker("", selection: $selectedGlobalUnit) {
                            ForEach(units, id: \.self) { item in
                                Text(item)
                            }
                        }.pickerStyle(.automatic)
                    }
                }
                Section("From") {
                    Picker("From", selection: $fromUnit) {
                        ForEach(currentUnit, id: \.self) { item in
                            Text(item)
                        }
                    }.pickerStyle(.segmented)
                }
                Section("To") {
                    Picker("To", selection: $toUnit) {
                        ForEach(currentUnit, id: \.self) { item in
                            Text(item)
                        }
                    }.pickerStyle(.segmented)
                }
                Section("Output") {
                    Text("\(output)")
                }
            }.navigationTitle("Vrtr.")
        }
    }
}

#Preview {
    ContentView()
}
