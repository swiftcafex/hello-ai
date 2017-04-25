//
//  Perceptron.swift
//  neuralNetworks
//
//  Created by icafe on 16/7/14.
//  Copyright © 2016年 swiftcafe. All rights reserved.
//

import UIKit

struct Perceptron {

    fileprivate var weights = Array(0...2).map{ _ in Float(arc4random() % 3) - 1 }
    
    fileprivate func active(_ sum: Float) -> Int { return sum > 0 ? 1 : -1 }
    
    func feedForward(_ inputs: [Float]) -> Int { return active(Array(0..<weights.count).reduce(0){ return $0 + inputs[$1] * weights[$1] }) }
    
    fileprivate let c:Float = 0.01
    
    mutating func train(_ inputs: [Float], desired: Int) {
        
        let guess = feedForward(inputs)
        let error = desired - guess
        
        for index in 0..<weights.count {
            weights[index] += c * Float(error) * inputs[index]
        }
    }
}
