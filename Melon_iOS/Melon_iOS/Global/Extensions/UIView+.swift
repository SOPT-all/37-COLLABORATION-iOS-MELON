//
//  UIView+.swift
//  Melon_iOS
//
//  Created by 조영서 on 11/15/25.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
    
    func gradient3() {
        self.layer.sublayers?
            .filter { $0 is CAGradientLayer }
            .forEach { $0.removeFromSuperlayer() }
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.bluegray.cgColor,
            UIColor.gray500.cgColor,
            UIColor.background.cgColor
        ]
        
        gradientLayer.locations = [ 0.0, 0.53, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        
        self.layer.insertSublayer(gradientLayer, at: 0)
        gradientLayer.frame = self.bounds
    }
}
