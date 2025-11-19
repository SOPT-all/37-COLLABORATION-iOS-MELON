//
//  LatestSongItemCell.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/19/25.
//

import UIKit

import SnapKit
import Then

final class LatestSongItemCell: BaseUICollectionViewCell, ReuseIdentifiable {
  
  // MARK: - UI Components
  
  private lazy var imageView = UIImageView().then {
    $0.contentMode = .scaleAspectFill
    $0.clipsToBounds = true
    $0.backgroundColor = .background2
    $0.layer.cornerRadius = 4
  }
  
  private lazy var playButton = UIButton().then {
    $0.contentMode = .scaleAspectFit
    $0.setImage(.icPlay24, for: .normal)
    $0.setImage(.icPause24, for: .selected)
    $0.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
  }
  
  private lazy var titleLabel = UILabel().then {
    $0.font = UIFont.pretendard(.body_m_14)
    $0.textColor = .white
    $0.numberOfLines = 2
  }
  
  private lazy var artistLabel = UILabel().then {
    $0.font = UIFont.pretendard(.caption_m_10)
    $0.textColor = .gray200
    $0.numberOfLines = 1
  }
  
  // MARK: - Setup Methods
  
  override func setUI() {
    addSubviews(imageView, playButton, titleLabel, artistLabel)
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
    
    artistLabel.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(2)
      $0.horizontalEdges.equalToSuperview()
    }
  }
  
  func configure(_ data: HomeDTO) {
    titleLabel.text = data.title
    artistLabel.text = data.artist
        
    if let imageUrl = data.imageUrl, let url = URL(string: imageUrl) {
      imageView.kf.setImage(
        with: url,
        placeholder: .none,
      )} else {
        imageView.image = .none
      }
  }
  
  // MARK: - Actions
  
  @objc private func playButtonTapped() {
    playButton.isSelected.toggle()
  }
}
