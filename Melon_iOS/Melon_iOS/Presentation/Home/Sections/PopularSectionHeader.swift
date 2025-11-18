//
//  PopularSectionHeader.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/18/25.
//

import UIKit

import SnapKit
import Then

final class PopularSectionHeader: BaseUICollectionReusableView, ReuseIdentifiable {
  
  // MARK: - UI Components
  
  private let label = UILabel().then {
    $0.font = UIFont.pretendard(.heading_b_20)
    $0.textColor = .white
    $0.text = "인기 선곡"
  }
  
  // MARK: - Setup Methods
  
  override func setUI() {
    addSubview(label)
  }
  
  override func setLayout() {
    label.snp.makeConstraints {
      $0.centerY.leading.equalToSuperview()
    }
  }
  
}
