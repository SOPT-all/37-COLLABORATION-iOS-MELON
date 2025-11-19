//
//  ChartCollectionViewCell.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/19/25.
//

import UIKit

import SnapKit
import Then

final class ChartCollectionViewCell : BaseUICollectionViewCell, ReuseIdentifiable {
  
  // MARK: - Properties
  
  static let horizontalPadding: CGFloat = 20
  
  // MARK: - Components
  
  private lazy var capsule = UIView().then {
    $0.layer.borderColor = UIColor.gray400.cgColor
    $0.layer.borderWidth = 0.5
    $0.layer.cornerRadius = 18.5
    $0.clipsToBounds = true
  }
  
  private lazy var label = UILabel().then {
    $0.font = UIFont.pretendard(.body_r_14)
    $0.textColor = .white
    $0.textAlignment = .center
  }
  
  // MARK: - Setup Methods
  
  override func setUI() {
    addSubviews(capsule, label)
  }
  
  override func setLayout() {
    layer.cornerRadius = 18.5
    clipsToBounds = true
    
    capsule.snp.makeConstraints {
      $0.height.equalTo(37)
      $0.width.greaterThanOrEqualTo(label.snp.width).inset(-ChartCollectionViewCell.horizontalPadding)
      $0.centerY.equalToSuperview()
    }
    
    label.snp.makeConstraints {
      $0.center.equalTo(capsule)
    }
  }
  
  func configure(with text: String) {
    label.text = text
  }
  
  // MARK: - Actions
  
  func selected() {
    backgroundColor = .primary
    capsule.layer.borderColor = UIColor.primary.cgColor
  }
  
  func deselected() {
    backgroundColor = .background
    capsule.layer.borderColor = UIColor.gray400.cgColor
  }
  
}
