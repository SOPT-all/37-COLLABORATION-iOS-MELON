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

import SnapKit
import Then

class testVC: UIViewController {
  let viewA = UIView().then {
    $0.backgroundColor = .red
  }
  let viewB = UIView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubviews(viewA, viewB)
    
    viewA.snp.makeConstraints { make in
      make.center.equalToSuperview()
      make.size.equalTo(100)
    }
    
    viewB.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(viewA.snp.bottom).offset(20)
      make.size.equalTo(100)
    }
    
    // ViewDidLoad에서 호출하면 적용이 안됩니다.
    viewA.applyBaeminGradient3()
    
  }
  
  // Bounds가 적용된 이후에 호출해야 적용됩니다.
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    viewB.applyBaeminGradient3()
  }
}

#Preview {
  testVC()
}
