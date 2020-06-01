//
//  ContentView.swift
//  BillionsCalculator
//
//  Created by Jamie Morgan on 5/31/20.
//  Copyright © 2020 Jamie Morgan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 0
        formatter.isLenient = true
        formatter.numberStyle = .currency
        return formatter
    }

    @State var endDollarValue: Double = 1000000000
    
    // TimeSpanPicker
    @State var timeWorkedFor = ""
    @State var timeSpanSelection = 0
    
    // DollarValuePicker
    @State var dollarValueSelection = 0
    @State var income = ""
    
    // SalaryPerPicker
    @State var earningPeriodSelection = 0
    
    
    var body: some View {
        
        VStack {
            Text("To Earn")
            TextField("To Earn", value: $endDollarValue, formatter: currencyFormatter) {
                self.submit()
            }.keyboardType(.decimalPad)
                .multilineTextAlignment(.center)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TimeSpanPicker(timeSpanSelection: $timeSpanSelection, timeWorkedFor: $timeWorkedFor)
            
            Text("While making...")
            DollarValuePicker(dollarValueSelection: $dollarValueSelection, income: $income)
            
            EarningPeriodsPicker(earningPeriodSelection: $earningPeriodSelection)
        }
    }
    
    func submit() {
//            totalTime = String(Int(endDollarValue)! / Int(income)!)
            print(endDollarValue)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
