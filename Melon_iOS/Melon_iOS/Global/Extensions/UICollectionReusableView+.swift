//
//  UICollectionReusableView+.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/18/25.
//

import UIKit

extension UICollectionReusableView {
  
  static func reuseIdentifier() -> String {
    return String(describing: self)
  }
  
}
