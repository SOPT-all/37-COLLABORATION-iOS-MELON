//
//  PersonalizedItemCell.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/18/25.
//

import UIKit

import SnapKit
import Then

final class PersonalizedItemCell: BaseUICollectionViewCell, ReuseIdentifiable {
  
  // MARK: - UI Components
  
  private let imageView = UIImageView().then {
    $0.contentMode = .scaleAspectFill
    $0.clipsToBounds = true
    $0.backgroundColor = .background2
    $0.layer.cornerRadius = 4
  }
  
  private let playButton = UIButton().then {
    $0.contentMode = .scaleAspectFit
    $0.setImage(.icPlay32, for: .normal)
    $0.setImage(.icPause32, for: .selected)
  }
  
  private let titleLabel = UILabel().then {
    $0.font = UIFont.pretendard(.body_m_14)
    $0.textColor = .white
  }
  
  // MARK: - Setup Methods
  
  override func setUI() {
    playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
    
    addSubviews(imageView, playButton, titleLabel)
  }
  
  override func setLayout() {
    imageView.snp.makeConstraints {
      $0.top.horizontalEdges.equalToSuperview()
      $0.height.equalTo(imageView.snp.width)
    }
    
    playButton.snp.makeConstraints {
      $0.size.equalTo(32)
      $0.top.trailing.equalTo(imageView)
    }
    
    titleLabel.snp.makeConstraints {
      $0.top.equalTo(imageView.snp.bottom).offset(4)
      $0.horizontalEdges.equalToSuperview()
    }
  }
  
  // MARK: - Actions
  
  @objc private func playButtonTapped() {
    playButton.isSelected.toggle()
  }
  
  func configure(data: PersonalizedDTO) {
    titleLabel.text = data.title
    imageView.image = data.image
  }
}
