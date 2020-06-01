//
//  DollarValuePicker.swift
//  BillionsCalculator
//
//  Created by Jamie Morgan on 5/31/20.
//  Copyright © 2020 Jamie Morgan. All rights reserved.
//

import SwiftUI

struct DollarValuePicker: View {
    @ObservedObject var textBindingManager = TextBindingManager(limit: 3)
    
    @State var dollarValues: [String] = dollarValuesArray
    @Binding var dollarValueSelection: Int
    @Binding var income: String
    
    var body: some View {
        HStack {
            TextField("$\(dollarValues[dollarValueSelection])", text: $textBindingManager.income) {
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
    }
}
