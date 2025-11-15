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
  
  // 반드시, 뷰의 bounds가 확정된 후 함수를 호출해주세요
  // UIView : layoutSubviews
  // UIViewController : viewDidLayoutSubviews
  func applyBaeminGradient3() {
    let gradientLayer = CAGradientLayer()
      
    gradientLayer.colors = [
      UIColor.gray500.cgColor,
      UIColor.background.cgColor,
    ]
    
    gradientLayer.locations = [0.53, 1.0]
    
    gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
    gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
    
    
    self.layer.addSublayer(gradientLayer)
    gradientLayer.frame = self.bounds
  }
}
