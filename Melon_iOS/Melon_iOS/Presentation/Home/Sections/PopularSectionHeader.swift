//
//  PopularSectionHeader.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/18/25.
//

import UIKit

import SnapKit
import Then

final class PopularSectionHeader: UICollectionReusableView {
  
  let label = UILabel().then {
    $0.font = .systemFont(ofSize: 20, weight: .bold)
    $0.text = "인기 선곡"
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(label)
    label.snp.makeConstraints {
      $0.centerY.leading.equalToSuperview()
    }
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
