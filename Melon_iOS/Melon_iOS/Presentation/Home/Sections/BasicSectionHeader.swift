//
//  PersonalizedSectionHeader.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/18/25.
//

import UIKit

import SnapKit
import Then

final class BasicSectionHeader: BaseUICollectionReusableView, ReuseIdentifiable {
  
  // MARK: - UI Components
  
  private let label = UILabel().then {
    $0.font = UIFont.pretendard(.heading_b_20)
    $0.textColor = .white
  }
  
  // MARK: - Setup Methods
  
  override func setUI() {
    addSubview(label)
  }
  
  override func setLayout() {
    label.snp.makeConstraints {
      $0.leading.equalToSuperview()
      $0.bottom.equalToSuperview().inset(12)
    }
  }
  
  func configure(title: String) {
    label.text = title
  }
}
