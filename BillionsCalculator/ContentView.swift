//
//  ContentView.swift
//  BillionsCalculator
//
//  Created by Jamie Morgan on 5/31/20.
//  Copyright © 2020 Jamie Morgan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var years = "10"
    @State var income = "10"
    @State var endDollarValue = ""
    @State var totalTime = "10"
    @State var timeSpanValue = "years"
    
    let timeSpans = ["Milleniums", "Centuries", "Decades", "Years", "Months", "Days", "Hours", "Minutes", "Seconds"]
    
    var body: some View {
        
        VStack {
            Text("I would have to work for")
            HStack {
                TextField("number", text: $totalTime)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                    .frame(width: 70)
                Picker(selection: .constant(0), label: Text("")) {
                    ForEach(0 ..< timeSpans.count) {
                        Text(self.timeSpans[$0]).tag($0)
                    }
                }
                .frame(minWidth: 0, maxWidth: 100, maxHeight: 100)
                .clipped()
                .labelsHidden()
            }
            Text("While making...")
            HStack {
                TextField("Dollars", text: $income) {
                    self.submit()
                }
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
                .frame(width: 70)
                Picker(selection: .constant(1), label: Text("")) {
                    Text("Billion").tag(1)
                    Text("Million").tag(2)
                }
                .frame(minWidth: 0, maxWidth: 100, maxHeight: 100)
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
    totalTime = String(Int(endDollarValue)! / Int(income)!)
    print()
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
