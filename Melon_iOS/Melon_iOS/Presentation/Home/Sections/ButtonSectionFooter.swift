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
  
  private let playButton = UIButton().then {
    $0.backgroundColor = .gray500
    $0.clipsToBounds = true
    $0.layer.cornerRadius = 4
  }
  
  private let hStack = UIStackView().then {
    $0.axis = .horizontal
    $0.spacing = 4
  }
  
  private let playIconImageView = UIImageView().then {
    $0.image = .icPlay24
  }
  
  private let playTitleLabel = UILabel().then {
    $0.textColor = .white
    $0.font = UIFont.pretendard(.body_m_14)
  }
  
  // MARK: - Setup Methods
  
  override func setUI() {
    addSubview(playButton)
    playButton.addSubview(hStack)
    hStack.addArrangedSubviews(playIconImageView, playTitleLabel)
  }
  
  override func setLayout() {
    playButton.snp.makeConstraints {
      $0.bottom.horizontalEdges.equalToSuperview()
      $0.height.equalTo(44)
    }
    
    hStack.snp.makeConstraints {
      $0.height.equalTo(24)
      $0.center.equalToSuperview()
    }
    
    playIconImageView.snp.makeConstraints {
      $0.size.equalTo(24)
    }
  }
  
  func configure(title: String) {
    playTitleLabel.text = title
  }
}

