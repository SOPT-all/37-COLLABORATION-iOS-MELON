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
  
  func applyGradient3() {
    let gradientLayer = CAGradientLayer()
    
    
    gradientLayer.colors = [
      UIColor(hexCode: "495263").cgColor,
      UIColor.gray500.cgColor,
      UIColor.background.cgColor
    ]
    
    gradientLayer.locations = [
      0.0,
      0.53,
      1.0
    ]
    
    gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
    gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)   
    
    self.layer.addSublayer(gradientLayer)
    gradientLayer.frame = self.bounds
  }
}
