//
//  ViewController.swift
//  neuralNetworks
//
//  Created by icafe on 16/7/14.
//  Copyright © 2016年 swiftcafe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var perceptron = Perceptron()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        trainPerceptron()
        
    }
    
    func trainPerceptron() {
        
        for _ in 0...5000000 {
            
            let x = random() % Int(self.view.frame.size.width)
            let y = random() % Int(self.view.frame.size.height)
            
            if y >= 200 {
                
                perceptron.train([Float(x),Float(y),Float(1.0)], desired: -1)
                
            } else {
                
                perceptron.train([Float(x),Float(y),Float(1.0)], desired: 1)
                
            }
            
        }
        
    }
    
    func setupUI() {
        
        let viewTop = UIView(frame: CGRect(x: 0.0, y: 0.0, width: Double(self.view.frame.size.width), height: 200.0))
        viewTop.backgroundColor = UIColor.redColor()
        self.view.addSubview(viewTop)
        
        let viewBottom = UIView(frame: CGRect(x: 0.0, y: 200.0, width: Double(self.view.frame.size.width), height: Double(self.view.frame.size.height) - 200.0))
        viewBottom.backgroundColor = UIColor.blueColor()
        self.view.addSubview(viewBottom)
        
    }

    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let point = touches.first?.locationInView(self.view) {
            
            let result = perceptron.feedForward([Float(point.x), Float(point.y), 1])
            print("\(point.x),\(point.y) \(result)")
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

