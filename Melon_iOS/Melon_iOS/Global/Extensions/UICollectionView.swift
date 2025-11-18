//
//  UICollectionView.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/18/25.
//

import UIKit

extension UICollectionView {
  
  func cellRegister<T: UICollectionViewCell & ReuseIdentifiable>(_ type: T.Type) {
    self.register(type.self, forCellWithReuseIdentifier: type.reuseIdentifier)
  }
  
  func headerRegister<T: UICollectionReusableView & ReuseIdentifiable>(_ type: T.Type) {
    self.register(
      type.self,
      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
      withReuseIdentifier: type.reuseIdentifier
    )
  }
  
  func footerRegister<T: UICollectionReusableView & ReuseIdentifiable>(_ type: T.Type) {
    self.register(
      type.self,
      forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
      withReuseIdentifier: type.reuseIdentifier
    )
  }
  
}
