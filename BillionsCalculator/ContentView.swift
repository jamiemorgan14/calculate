//
//  ContentView.swift
//  BillionsCalculator
//
//  Created by Jamie Morgan on 5/31/20.
//  Copyright © 2020 Jamie Morgan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var income = ""
    @State var endDollarValue = ""
    @State var timeWorkedFor = ""
    @State var timeSpanSelection = 0
    @State var dollarValueSelection = 0
    
    @ObservedObject var textBindingManager = TextBindingManager(limit: 3)
    
    let timeSpans = ["Milleniums", "Centuries", "Decades", "Years", "Months", "Days", "Hours", "Minutes", "Seconds"]
    let dollarValues = ["Billion", "Million", "Thousand", "Hundred"]
    
    var body: some View {
        
        VStack {
            Text("I would have to work for")
            HStack {
                TextField(timeSpans[timeSpanSelection], text: $timeWorkedFor)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                    .frame(width: 70)
                Picker(selection: $timeSpanSelection, label: Text("")) {
                    ForEach(0 ..< timeSpans.count) {
                        Text(self.timeSpans[$0]).tag($0)
                    }
                }
                .frame(minWidth: 0, maxWidth: 150, maxHeight: 100)
                .clipped()
                .labelsHidden()
            }
            Text("While making...")
            HStack {
                TextField(dollarValues[dollarValueSelection], text: $textBindingManager.income) {
                    self.income = self.textBindingManager.income
                }
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
                .frame(width: 70)
                Picker(selection: $dollarValueSelection, label: Text("")) {
                    ForEach(0 ..< dollarValues.count) {
                        Text(self.dollarValues[$0]).tag($0)
                    }
                }
                .frame(minWidth: 0, maxWidth: 150, maxHeight: 100)
                .clipped()
                .labelsHidden()
            }
            Text("Per Year")
            Text("to earn")
            TextField("Dollars", text: $endDollarValue) {
                self.submit()
            }.keyboardType(.numberPad)
                .multilineTextAlignment(.center)
        }
    }
    
    func submit() {
        //    totalTime = String(Int(endDollarValue)! / Int(income)!)
        //    print()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
