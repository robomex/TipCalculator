//
//  TipCalculatorModel.swift
//  TipCalculator
//
//  Created by Tony Morales on 7/3/14.
//  Copyright (c) 2014 Tony Morales. All rights reserved.
//

import Foundation

class TipCalculatorModel {
    
    var total: Double
    var taxPct: Double
    var subtotal: Double {
        get {
            return total / (taxPct + 1)
        }
    }
    
    init(total:Double, taxPct:Double) {
        self.total = total
        self.taxPct = taxPct
    }
    
    func calcTipWithTipPct(tipPct:Double) -> Double {
        return subtotal * tipPct
    }
    
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