//
//  MeasurementsCalculator.swift
//  metrics-conversion
//
//  Created by Rafael Badaró on 15/03/24.
//

import Foundation


enum ImperialSystem : String, CaseIterable, Identifiable{
   case feet, inch, miles
   var id: Self { self }
}

enum MetricSystem : String, CaseIterable, Identifiable{
   case centimeters, meter, kilometer
   var id: Self { self }
}


struct MeasurementsCalculator {
        
    static func convertToMetricSystem(
        _ valueImperialToConvert: Double,
        _ selectedImperial: ImperialSystem,
        _ selectedMetric: MetricSystem) -> Double {
            
            switch (selectedImperial, selectedMetric) {
            case (.miles, .kilometer):
                return MilesCalculator.calculateMilesToKilometers(valueInMiles: valueImperialToConvert)
            case (.miles, .meter):
                return MilesCalculator.calculateMilesToMeters(valueInMiles: valueImperialToConvert)
            case (.miles, .centimeters):
                return MilesCalculator.calculateMilesToCentimeters(valueInMiles: valueImperialToConvert)
                
            case (.inch, .kilometer):
                return InchesCalculator.calculateInchesToKilometers(valueInInches: valueImperialToConvert)
            case (.inch, .meter):
                return InchesCalculator.calculateInchesToMeters(valueInInches: valueImperialToConvert)
            case (.inch, .centimeters):
                return InchesCalculator.calculateInchesToCentimeters(valueInInches: valueImperialToConvert)
                
            case (.feet, .kilometer):
                return FeetCalculator.calculateFeetToKilometers(valueInFeet: valueImperialToConvert)
            case (.feet, .meter):
                return FeetCalculator.calculateFeetToMeters(valueInFeet: valueImperialToConvert)
            case (.feet, .centimeters):
                return FeetCalculator.calculateFeetToCentimeters(valueInFeet: valueImperialToConvert)
            }
            
    }
    
    static func convertToImperialSystem(
        _ valueMetricToConvert: Double,
        _ selectedImperial: ImperialSystem,
        _ selectedMetric: MetricSystem) -> Double {
            
            switch (selectedMetric, selectedImperial) {
            case (.kilometer, .miles):
                return KilometersCalculator.calculateKilometersToMiles(valueInKm: valueMetricToConvert)
            case (.kilometer, .inch):
                return KilometersCalculator.calculateKilometersToInches(valueInKm: valueMetricToConvert)
            case (.kilometer, .feet):
                return KilometersCalculator.calculateKilometersToFeet(valueInKm: valueMetricToConvert)
                
            case (.meter, .miles):
                return MetersCalculator.calculateMetersToMiles(valueInMeters: valueMetricToConvert)
            case (.meter, .inch):
                return MetersCalculator.calculateMetersToInches(valueInMeters: valueMetricToConvert)
            case (.meter, .feet):
                return MetersCalculator.calculateMetersToFeet(valueInMeters: valueMetricToConvert)
                
            case (.centimeters, .miles):
                return CentimetersCalculator.calculateCentimetersToMiles(valueInCentimeters: valueMetricToConvert)
            case (.centimeters, .inch):
                return CentimetersCalculator.calculateCentimetersToInches(valueInCentimeters: valueMetricToConvert)
            case (.centimeters, .feet):
                return CentimetersCalculator.calculateCentimetersToFeet(valueInCentimeters: valueMetricToConvert)
            }
    }
    
}

struct KilometersCalculator {
    
    static func calculateKilometersToMiles(valueInKm: Double) -> Double {
        return valueInKm / 1.609
    }
    
    static func calculateKilometersToInches(valueInKm: Double) -> Double {
        return valueInKm * 39370
    }
    
    static func calculateKilometersToFeet(valueInKm: Double) -> Double {
        return valueInKm * 3281
    }
}

struct MetersCalculator {
    
    static func calculateMetersToMiles(valueInMeters: Double) -> Double {
        return valueInMeters / 1609
    }
    
    static func calculateMetersToInches(valueInMeters: Double) -> Double {
        return valueInMeters * 39.37
    }
    
    static func calculateMetersToFeet(valueInMeters: Double) -> Double {
        return valueInMeters * 3.281
    }
}

struct CentimetersCalculator {
    
    static func calculateCentimetersToMiles(valueInCentimeters: Double) -> Double {
        return valueInCentimeters / 160900
    }
    
    static func calculateCentimetersToInches(valueInCentimeters: Double) -> Double {
        return valueInCentimeters / 2.54
    }
    
    static func calculateCentimetersToFeet(valueInCentimeters: Double) -> Double {
        return valueInCentimeters / 30.48
    }
}


struct MilesCalculator {
    
    static func calculateMilesToKilometers(valueInMiles: Double) -> Double {
        return valueInMiles * 1.609
    }
    
    static func calculateMilesToMeters(valueInMiles: Double) -> Double {
        return valueInMiles * 1609
    }
    
    static func calculateMilesToCentimeters(valueInMiles: Double) -> Double {
        return valueInMiles * 160900
    }
}

struct InchesCalculator {
    
    static func calculateInchesToKilometers(valueInInches: Double) -> Double {
        return valueInInches / 39370
    }
    
    static func calculateInchesToMeters(valueInInches: Double) -> Double {
        return valueInInches / 39.37
    }
    
    static func calculateInchesToCentimeters(valueInInches: Double) -> Double {
        return valueInInches * 2.54
    }
}

struct FeetCalculator {
    
    static func calculateFeetToKilometers(valueInFeet: Double) -> Double {
        return valueInFeet / 3281
    }
    
    static func calculateFeetToMeters(valueInFeet: Double) -> Double {
        return valueInFeet / 3.281
    }
    
    static func calculateFeetToCentimeters(valueInFeet: Double) -> Double {
        return valueInFeet * 30.48
    }
}
