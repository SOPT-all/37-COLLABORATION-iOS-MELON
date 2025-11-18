//
//  PreferenceSongView.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/18/25.
//

import UIKit

import SnapKit
import Then

final class PreferenceSongView: BaseUIView {
  
  private lazy var coverImageView = UIImageView().then {
    $0.contentMode = .scaleAspectFit
    $0.image = .imgPreference
  }
  
  private lazy var playButton = UIButton().then {
    $0.contentMode = .scaleAspectFit
    $0.setImage(.icPlay24, for: .normal)
    $0.setImage(.icPause32, for: .selected)
    $0.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
  }
  
  private lazy var infoStack = UIStackView().then {
    $0.axis = .vertical
  }
  
  private lazy var titleLabel = UILabel().then {
    $0.font = UIFont.pretendard(.caption_r_12)
    $0.text = "내 취향 기반 추천 곡"
    $0.textColor = .white
  }
  
  private lazy var songNameLabel = UILabel().then {
    $0.font = UIFont.pretendard(.body_r_14)
    $0.text = "The Day"
    $0.textColor = .white
  }
  
  private lazy var artistNameLabel = UILabel().then {
    $0.font = UIFont.pretendard(.caption_r_12)
    $0.text = "DAY6(데이식스)"
    $0.textColor = .gray200
  }
  
  // MARK: - Setup Methods
    
  override func setUI() {
    backgroundColor = .gray500
    clipsToBounds = true
    layer.cornerRadius = 4
    
    addSubviews(coverImageView, playButton, infoStack)
    
    infoStack.addArrangedSubviews(titleLabel, songNameLabel, artistNameLabel)
  }
  
  override func setLayout() {
    coverImageView.snp.makeConstraints {
      $0.verticalEdges.leading.equalToSuperview()
      $0.height.equalToSuperview()
    }
    
    playButton.snp.makeConstraints {
      $0.size.equalTo(24)
      $0.top.equalToSuperview().offset(4)
      $0.trailing.equalTo(coverImageView)
    }
    
    infoStack.snp.makeConstraints {
      $0.leading.equalTo(coverImageView.snp.trailing).offset(16)
      $0.centerY.equalToSuperview()
    }
  }
  
  // MARK: - Actions
  
  @objc private func playButtonTapped() {
    playButton.isSelected.toggle()
  }
  
}

