//
//  TemperatureConverterView.swift
//  metrics-conversion
//
//  Created by Rafael Badaró on 01/03/24.
//

import SwiftUI

struct TemperatureConverterView: View {
    @State private var fahrenheitInput: String = ""
    @State private var celsiusInput: String = ""
    @State private var isFahrenheitFieldFocused = false
    @State private var isCelciusFieldFocused = false
    
    var body: some View {
        
        VStack {
            TextField("Enter Fahrenheit", text: $fahrenheitInput, onEditingChanged: setFocusFahrenheit)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onChange(of: fahrenheitInput) { newValue in
                    
                    if isFahrenheitFieldFocused {
                        if let value = Double(newValue) {
                            celsiusInput = String(format: "%.2f", (value - 32) * 5/9)
                        } else {
                            celsiusInput = ""
                        }
                    }
                    
                }
            
            TextField("Enter Celsius", text: $celsiusInput, onEditingChanged: setFocusCelcius)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onChange(of: celsiusInput) { newValue in
                    
                    if isCelciusFieldFocused {
                        if let value = Double(newValue) {
                            fahrenheitInput = String(format: "%.2f", value * 9/5 + 32)
                        } else {
                            fahrenheitInput = ""
                        }
                    }
                }
        }
        .padding()
        
    }
    
    func setFocusFahrenheit(focused: Bool) {
        isFahrenheitFieldFocused = focused
    }
    
    func setFocusCelcius(focused: Bool) {
        isCelciusFieldFocused = focused
    }
}

struct TemperatureConverterView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureConverterView()
    }
}


