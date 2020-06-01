//
//  EarningPeriodsPicker.swift
//  BillionsCalculator
//
//  Created by Jamie Morgan on 5/31/20.
//  Copyright © 2020 Jamie Morgan. All rights reserved.
//

import SwiftUI

struct EarningPeriodsPicker: View {
    @State var earningPeriods = earningPeriodsArray
    @Binding var earningPeriodSelection: Int
    
    var body: some View {
        HStack {
            Text("Per").padding(.trailing)
            Picker(selection: $earningPeriodSelection, label: Text("")) {
                ForEach(0 ..< earningPeriods.count) {
                    Text(self.earningPeriods[$0]).tag($0)
                }
            }
            .frame(minWidth: 0, maxWidth: 150, maxHeight: 100)
            .clipped()
            .labelsHidden()
        }
    }
}
