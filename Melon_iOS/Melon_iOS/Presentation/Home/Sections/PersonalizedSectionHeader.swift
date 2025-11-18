//
//  PersonalizedSectionHeader.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/18/25.
//

import UIKit

import SnapKit
import Then

final class PersonalizedSectionHeader: UICollectionReusableView {
  
  let label = UILabel().then {
    $0.font = .systemFont(ofSize: 20, weight: .bold)
    $0.text = "사용자님을 위한 추천"
  }
  
  private lazy var seeAllButton = UIButton().then {
    $0.setTitle("전체보기", for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
    $0.setTitleColor(.darkGray, for: .normal)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(label)
    addSubview(seeAllButton)
    label.snp.makeConstraints {
      $0.centerY.leading.equalToSuperview()
    }
    
    seeAllButton.snp.makeConstraints {
      $0.centerY.trailing.equalToSuperview()
    }
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
