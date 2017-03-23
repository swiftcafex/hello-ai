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
    
        DispatchQueue.global().async {
            self.trainPerceptron()
            
            DispatchQueue.main.async {
                self.setupUI()
            }
        }
    }
    
    func trainPerceptron() {
        
        for _ in 0...5000000 {
            
            let x = arc4random() % UInt32(view.frame.size.width)
            let y = arc4random() % UInt32(view.frame.size.height)

            perceptron.train([Float(x),Float(y),Float(1.0)], desired: y >= 200 ? -1 : 1)
        }
    }
    
    func setupUI() {
        
        let viewTop = UIView(frame: CGRect(x: 0.0, y: 0.0, width: view.frame.width, height: 200.0))
        viewTop.backgroundColor = .red
        view.addSubview(viewTop)
        
        let viewBottom = UIView(frame: CGRect(x: 0.0, y: 200.0, width: view.frame.width, height: view.frame.height - 200.0))
        viewBottom.backgroundColor = .blue
        view.addSubview(viewBottom)
        
    }

    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let point = touches.first?.location(in: view) {
            
            let result = perceptron.feedForward([Float(point.x), Float(point.y), 1])
            print("\(point.x),\(point.y) \(result)")
            
        }
        
    }
}

