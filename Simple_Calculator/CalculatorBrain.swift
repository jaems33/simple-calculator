//
//  CalculatorBrain.swift
//  Simple_Calculator
//
//  Created by James Teow on 10/6/16.
//  Copyright © 2016 James Teow. All rights reserved.
//

import Foundation

class CalculatorBrain {
    
    fileprivate var accumulator = 0.0
    
    fileprivate var pending:PendingBinaryOperation?
    
    
    var operations: [String: Operation] = [
        "+" : Operation.binaryOperation({$0 + $1})
    ]
    
    enum Operation {
        case binaryOperation((Double, Double) -> Double)
    }
    
    func performOperation(_ symbol:String){
        if let operation = operations[symbol]{
            switch operation {
            case .binaryOperation(let function):
                executePendingBinaryOperation()
                pending = PendingBinaryOperation(binaryFunction: function, firstOperand: accumulator )
            }
        }
    }
    
    fileprivate func executePendingBinaryOperation(){
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            pending = nil
        }
    }
    
    struct PendingBinaryOperation {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
    }
    
    var result: Double {
        get {
            return accumulator
        }
    }
    
}
