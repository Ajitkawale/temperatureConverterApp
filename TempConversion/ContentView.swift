//
//  ContentView.swift
//  TempConversion
//
//  Created by Ajit Kawale on 19/09/25.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit = "Celsius"
    @State private var outputUnit = "Fahrenheit"
    @State private var inputValue = 0.0
    @FocusState private var tempIsFocused: Bool
    
    let unit = ["Celsius", "Fahrenheit", "Kelvin"]
    let unitSymbols = ["Celsius": "°C", "Fahrenheit": "°F", "Kelvin": "K"]
    
    var convertedValue: Double {
        // Step 1: normalize input → Celsius
        let celsius: Double
        switch inputUnit {
        case "Fahrenheit":
            celsius = (inputValue - 32) * 5 / 9
        case "Kelvin":
            celsius = inputValue - 273.15
        default:
            celsius = inputValue
        }
        
        // Step 2: convert Celsius → output unit
        switch outputUnit {
        case "Fahrenheit":
            return (celsius * 9 / 5) + 32
        case "Kelvin":
            return celsius + 273.15
        default:
            return celsius
        }
    }
    
    var outputUnitSymbol: String {
        switch outputUnit {
        case "Celsius": return "°C"
        case "Fahrenheit": return "°F"
        case "Kelvin": return "K"
        default: return ""
        }
    }
    
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section ("Choose input unit !"){
                    Picker("Unit", selection: $inputUnit) {
                        ForEach(unit, id: \.self) { unit in
                            Text(unit)
                            
                        }
                    }
                    .pickerStyle(.segmented)
                    
                }
                
                
                
                Section("Input") {
                    TextField("Temperature", value: $inputValue, format: .number.precision(.fractionLength(2)))
                        
                        .overlay(
                                Text(unitSymbols[inputUnit] ?? "")
                                    .padding(.trailing, 8),
                                alignment: .trailing
                            )
                        .keyboardType(.decimalPad)
                        .focused($tempIsFocused)
                    
                }
                
                Section("Output unit") {
                    Picker("To", selection: $outputUnit) {
                        ForEach(unit, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                    
                    .pickerStyle(.segmented)
                }
               
                Section("Converted Temprature") {
                    TextField("Converted", value: .constant(convertedValue), format: .number.precision(.fractionLength(2)))
                        .overlay(
                                Text(unitSymbols[outputUnit] ?? "")
                                    .padding(.trailing, 8),
                                alignment: .trailing
                            )
                        .disabled(true) // makes it read-only so user can’t type
                        
                    
                    
                }
                
            }
            .navigationTitle("Temprature Coversion")
            .toolbar {
                if tempIsFocused
                {
                    Button("Done") {
                        tempIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

    
    
    //Testing Github Commit
     //test commit 2

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    



