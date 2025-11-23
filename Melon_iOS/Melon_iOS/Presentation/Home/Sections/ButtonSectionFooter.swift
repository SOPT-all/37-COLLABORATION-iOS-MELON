//
//  ButtonSectionFooter.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/18/25.
//

import UIKit

import SnapKit
import Then

final class ButtonSectionFooter: BaseUICollectionReusableView, ReuseIdentifiable {
  
  // MARK: - UI Components
  
  private let playButton = CTAButton(
    style: .filledBlack,
    label: "TOP 100 전체듣기",
    font: .pretendard(.body_m_14),
    image: .icPause24,
    imageSize: 24,
    imageTextSpacing: 4,)
  
  // MARK: - Setup Methods
  
  override func setUI() {
    addSubview(playButton)
  }
  
  override func setLayout() {
    playButton.snp.makeConstraints {
      $0.top.equalToSuperview().offset(20)
      $0.horizontalEdges.equalToSuperview()
      $0.height.equalTo(44)
    }
  }
  
  func configure(title: String) {
    playButton.titleLabel?.text = title
  }
}

