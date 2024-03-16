//
//  MeasurementsConverterView.swift
//  metrics-conversion
//
//  Created by Rafael Badaró on 15/03/24.
//

import SwiftUI

struct MeasurementsConverterView: View {
    @State private var imperialSystemInput: String = ""
    @State private var isImperialSystemFieldFocused = false

    @State private var metricSystemInput: String = ""
    @State private var isMetricSystemFieldFocused = false
    
    @State private var selectedImperial: ImperialSystem = .miles
    @State private var selectedMetric: MetricSystem = .kilometer
    
    var body: some View {
        
        VStack {
            HStack {
                Picker("Imperial System", selection: $selectedImperial) {
                    ForEach(ImperialSystem.allCases) { measure in
                        Text(measure.rawValue.capitalized)
                    }
                }
                TextField("Enter imperial system", text: $imperialSystemInput, onEditingChanged: setFocusImperialSystemField)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onChange(of: imperialSystemInput) { newValue in
                        
                        if isImperialSystemFieldFocused {
                            if let valueToConvert = Double(newValue) {
                                let convertedValue = MeasurementsCalculator.convertToMetricSystem( valueToConvert, selectedImperial, selectedMetric)
                                metricSystemInput = String(format: "%.2f", convertedValue)
                            } else {
                                metricSystemInput = ""
                            }
                        }
                        
                    }
            }
            
            HStack{
                Picker("Metric System", selection: $selectedMetric) {
                    ForEach(MetricSystem.allCases) { measure in
                        Text(measure.rawValue.capitalized)
                    }
                }
                
                TextField("Enter metric system", text: $metricSystemInput, onEditingChanged: setFocusMetricSystemField)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onChange(of: metricSystemInput) { newValue in
                        
                        if isMetricSystemFieldFocused {
                            if let valueToConvert = Double(newValue) {
                                let convertedValue = MeasurementsCalculator.convertToImperialSystem( valueToConvert, selectedImperial, selectedMetric)
                                imperialSystemInput = String(format: "%.2f", convertedValue)
                            } else {
                                imperialSystemInput = ""
                            }
                        }
                    }
            }

        }
        .padding()
        
    }
    
    func setFocusImperialSystemField(focused: Bool) {
        isImperialSystemFieldFocused = focused
    }
    
    func setFocusMetricSystemField(focused: Bool) {
        isMetricSystemFieldFocused = focused
    }
}

struct MeasurementsConverterView_Previews: PreviewProvider {
    static var previews: some View {
        MeasurementsConverterView()
    }
}
