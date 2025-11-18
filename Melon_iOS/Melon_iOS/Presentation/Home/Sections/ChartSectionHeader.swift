//
//  ChartSectionHeader.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/18/25.
//

import UIKit

import SnapKit
import Then

final class ChartSectionHeader: BaseUICollectionReusableView, ReuseIdentifiable {
  
  private let titleFrame = UIView()
  
  // MARK: - UI Components
  
  private let standardTime = UILabel().then {
    $0.font = UIFont.pretendard(.body_b_14)
    $0.textColor = .gray200
    $0.text = "오늘 10시 기준"
  }
  
  private let label = UILabel().then {
    $0.font = UIFont.pretendard(.heading_b_20)
    $0.textColor = .white
    $0.text = "멜론차트"
  }
  
  private lazy var seeAllButton = UIButton().then {
    $0.setTitle("전체보기", for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
    $0.setTitleColor(.gray200, for: .normal)
  }
  
  // MARK: - Setup Methods
  
  override func setUI() {
    addSubview(titleFrame)
    titleFrame.addSubview(standardTime)
    titleFrame.addSubview(label)
    titleFrame.addSubview(seeAllButton)
  }
  
  override func setLayout() {
    titleFrame.snp.makeConstraints {
      $0.height.equalTo(53)
      $0.top.horizontalEdges.equalToSuperview()
    }
    
    standardTime.snp.makeConstraints {
      $0.leading.equalToSuperview()
      $0.top.equalToSuperview().offset(10)
    }
    
    label.snp.makeConstraints {
      $0.leading.equalToSuperview()
      $0.top.equalTo(standardTime.snp.bottom)
    }
    
    seeAllButton.snp.makeConstraints {
      $0.centerY.trailing.equalToSuperview()
    }
  }
  
}
