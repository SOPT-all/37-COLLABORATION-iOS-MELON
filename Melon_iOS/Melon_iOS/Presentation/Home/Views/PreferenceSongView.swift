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
  
  private let imageView = UIImageView().then {
    $0.contentMode = .scaleAspectFit
    $0.backgroundColor = .bar1
  }
  
  private let playButton = UIButton().then {
    $0.contentMode = .scaleAspectFit
    $0.setImage(.icPlay24, for: .normal)
    $0.setImage(.icPause32, for: .selected)
  }
  
  private let infoStack = UIStackView().then {
    $0.axis = .vertical
  }
  
  private let titleLabel = UILabel().then {
    $0.font = UIFont.pretendard(.caption_r_12)
    $0.text = "내 취향 기반 추천 곡"
    $0.textColor = .white
  }
  
  private let songNameLabel = UILabel().then {
    $0.font = UIFont.pretendard(.body_r_14)
    $0.text = "The Day"
    $0.textColor = .white
  }
  
  private lazy var artistNameLabel = UILabel().then {
    $0.font = UIFont.pretendard(.caption_r_12)
    $0.textColor = .gray200
  }
  
  // MARK: - Setup Methods
    
  override func setUI() {
    backgroundColor = .gray500
    clipsToBounds = true
    layer.cornerRadius = 4
    
    addSubviews(imageView, playButton, infoStack)
    infoStack.addArrangedSubviews(titleLabel, songNameLabel, artistNameLabel)
    
    playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
  }
  
  override func setLayout() {
    imageView.snp.makeConstraints {
      $0.verticalEdges.leading.equalToSuperview()
      $0.width.equalTo(imageView.snp.height)
    }
    
    playButton.snp.makeConstraints {
      $0.size.equalTo(24)
      $0.top.equalToSuperview().offset(4)
      $0.trailing.equalTo(imageView)
    }
    
    infoStack.snp.makeConstraints {
      $0.leading.equalTo(imageView.snp.trailing).offset(16)
      $0.centerY.equalToSuperview()
    }
  }
  
  // MARK: - Actions
  
  @objc private func playButtonTapped() {
    playButton.isSelected.toggle()
  }
  
  func configure(_ data: PreferencedSongDTO) {
    songNameLabel.text = data.title
    artistNameLabel.text = data.artist
    
    if let imageUrl = data.imageUrl, let url = URL(string: imageUrl) {
      imageView.kf.setImage(
        with: url,
        placeholder: .none,
      )} else {
        imageView.image = .none
      }
  }
}

