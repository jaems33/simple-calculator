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
    fileprivate var isPartialResult:Bool = false
    
    func setOperand(_ operand:Double){
        accumulator = operand
    }
    
    func setPartialResult(_ status:Bool){
        isPartialResult = status
    }
    
    var operations: [String: Operation] = [
        "+" : Operation.binaryOperation({$0 + $1}),
        "-" : Operation.binaryOperation({$0 - $1}),
        "÷" : Operation.binaryOperation({$0 / $1}),
        "×" : Operation.binaryOperation({$0 * $1}),
        "=" : Operation.equals
    ]
    
    enum Operation {
        case binaryOperation((Double, Double) -> Double)
        case equals
    }
    
    func performOperation(_ symbol:String){
        if let operation = operations[symbol]{
            switch operation {
            case .binaryOperation(let function):
                executePendingBinaryOperation()
                pending = PendingBinaryOperation(binaryFunction: function, firstOperand: accumulator )
            case .equals:
                executePendingBinaryOperation()
            }
        }
    }
    
    fileprivate func executePendingBinaryOperation(){
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            pending = nil
        }
    }
    
    func clear(){
        accumulator = 0.0
        pending = nil
        isPartialResult = false
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
