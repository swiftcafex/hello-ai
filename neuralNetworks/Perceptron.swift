//
//  Perceptron.swift
//  neuralNetworks
//
//  Created by icafe on 16/7/14.
//  Copyright © 2016年 swiftcafe. All rights reserved.
//

import UIKit

struct Perceptron {

    var weights: [Float]
    
    init() {
        
        weights = [Float]()

        for _ in 0...2 {

            let randWeight = random() % 3 - 1
            weights.append(Float(randWeight))

        }
        
    }
    
    func active(sum: Float) -> Int {
        
        if sum > 0 {
            
            return 1
            
        } else {
            
            return -1
            
        }
        
    }
    
    func feedForward(inputs: [Float]) -> Int {
        
        var sum: Float = 0.0
        
        for index in 0..<weights.count {

            sum += inputs[index] * weights[index]
            
        }
        
        return active(sum)
        
    }
    
    var c:Float = 0.01
    
    mutating func train(inputs: [Float], desired: Int) {
        
        let guess = feedForward(inputs)
        let error = desired - guess
        
        for index in 0..<weights.count {
            
            weights[index] += c * Float(error) * inputs[index]
            
        }
        
    }
    
}
