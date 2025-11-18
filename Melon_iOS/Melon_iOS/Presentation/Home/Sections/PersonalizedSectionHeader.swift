//
//  PersonalizedSectionHeader.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/18/25.
//

import UIKit

import SnapKit
import Then

final class PersonalizedSectionHeader: BaseUICollectionReusableView, ReuseIdentifiable {
  
  // MARK: - UI Components
  
  private let label = UILabel().then {
    $0.font = UIFont.pretendard(.heading_b_20)
    $0.textColor = .white
    $0.text = "사용자님을 위한 추천"
  }
  
  private lazy var seeAllButton = UIButton().then {
    $0.setTitle("전체보기", for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
    $0.setTitleColor(.gray200, for: .normal)
  }
  
  // MARK: - Setup Methods
  
  override func setUI() {
    addSubview(label)
    addSubview(seeAllButton)
  }
  
  override func setLayout() {
    label.snp.makeConstraints {
      $0.centerY.leading.equalToSuperview()
    }
    
    seeAllButton.snp.makeConstraints {
      $0.centerY.trailing.equalToSuperview()
    }
  }
  
}
