//
//  ContentView.swift
//  Unit Conversion
//
//  Created by Hadi on 30/04/1446 AH.
//

import SwiftUI

struct ContentView: View {
   
    
    @State private var inputlength = 0.0
    
    
    @State private var inputunitPicked = "Meters"
    @State private var outPutunitPicked = "Meters"
    var LengthUnits = ["Meters", "Kilometers", "Feet", "Yards" , "Miles"]
    
    var baseUnit: Double {
        let meters: Double
        switch inputunitPicked {
        case "Meters":
            meters = inputlength
        case "Kilometers":
            meters = inputlength * 1000
        case "Feet":
            meters = inputlength / 3.28084
        case "Yards":
            meters = inputlength / 1.09361
        case "Miles":
            meters = inputlength / 0.000621371
        default:
            meters = 0.0
        }
        return meters
    }
    
        
        
        
        var outPutlength : Double{
            let meters: Double
            switch outPutunitPicked {
            case "Meters":
                return baseUnit
            case "Kilometers":
                return baseUnit / 1000
            case "Feet":
                return baseUnit * 3.28084
            case "Yards":
                return baseUnit * 1.09361
            case "Miles":
                return baseUnit * 0.000621371
            default:
                return 0.0
            }
        }
        
        
        var body: some View {
            Form{
                Section{
                    Picker("A", selection: $inputunitPicked){
                        ForEach(LengthUnits, id: \.self){
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                    TextField("Input Length", value: $inputlength , format: .number)
                }
                Section{
                    Picker("A", selection: $outPutunitPicked){
                        ForEach(LengthUnits, id: \.self){
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                    Text(outPutlength, format: .number)
                }
            }
            
        }
   
    }

#Preview {
    ContentView()
}
