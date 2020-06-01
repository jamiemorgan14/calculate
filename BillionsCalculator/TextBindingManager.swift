//
//  TextBindingManager.swift
//  BillionsCalculator
//
//  Created by Jamie Morgan on 5/31/20.
//  Copyright © 2020 Jamie Morgan. All rights reserved.
//

import Foundation
import SwiftUI

class TextBindingManager: ObservableObject {
    @Published var income = "" {
        didSet {
            if income.count > characterLimit && oldValue.count <= characterLimit {
                income = oldValue
            }
        }
    }
    
    @Published var timeWorkedFor = "" {
        didSet {
            if timeWorkedFor.count > characterLimit && oldValue.count <= characterLimit {
                timeWorkedFor = oldValue
            }
        }
    }
       
    
    let characterLimit: Int

    init(limit: Int = 5){
        characterLimit = limit
    }
}
