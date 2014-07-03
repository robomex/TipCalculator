//
//  TipCalculatorModel.swift
//  TipCalculator
//
//  Created by Tony Morales on 7/3/14.
//  Copyright (c) 2014 Tony Morales. All rights reserved.
//

import Foundation

// Tip Calculator

//1

class TipCalculatorModel {
    // 2
    var total: Double
    var taxPct: Double
    let subtotal: Double
    
    // 3
    init(total:Double, taxPct:Double) {
        // append the self. prefix before the class property names, not the method parameters
        self.total = total
        self.taxPct = taxPct
        subtotal = total / (taxPct + 1)
    }
    
    // 4
    func calcTipWithTipPct(tipPct:Double) -> Double {
        return subtotal * tipPct
    }
    
    // 5
    func returnPossibleTips() -> Dictionary<Int, Double> {
        let possibleTips = [0.15, 0.18, 0.20]
        
        var retval = Dictionary<Int, Double>()
        for possibleTip in possibleTips {
            let intPct = Int(possibleTip*100)
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
    }
}