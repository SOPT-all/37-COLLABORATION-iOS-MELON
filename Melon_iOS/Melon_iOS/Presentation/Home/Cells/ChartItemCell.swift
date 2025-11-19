//
//  ChartItemCell.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/19/25.
//

import UIKit

import SnapKit
import Then

final class ChartItemCell: BaseUICollectionViewCell, ReuseIdentifiable {
  
  // MARK: - UI Components
  
  private lazy var imageView = UIImageView().then {
    $0.contentMode = .scaleAspectFill
    $0.clipsToBounds = true
    $0.backgroundColor = .background2
    $0.layer.cornerRadius = 4
  }
  
  private lazy var rankStack = UIStackView().then {
    $0.axis = .vertical
    $0.alignment = .center
    $0.spacing = 4
  }
  
  private lazy var rankLabel = UILabel().then {
    $0.font = UIFont.pretendard(.body_r_14)
    $0.textColor = .white
    $0.text = "1"
  }
  
  private lazy var rankChangeLabel = UILabel().then {
    $0.font = UIFont.pretendard(.caption_r_12)
    $0.textColor = .gray300
    $0.text = "-"
  }
  
  private lazy var infoStack = UIStackView().then {
    $0.axis = .vertical
    $0.alignment = .leading
    $0.spacing = 4
  }
  
  private lazy var titleLabel = UILabel().then {
    $0.font = UIFont.pretendard(.body_r_14)
    $0.textColor = .white
    $0.numberOfLines = 2
  }
  
  private lazy var artistLabel = UILabel().then {
    $0.font = UIFont.pretendard(.caption_r_12)
    $0.textColor = .gray200
    $0.numberOfLines = 1
  }
  
  private lazy var playButton = UIButton().then {
    $0.contentMode = .scaleAspectFit
    $0.setImage(.icPlay24, for: .normal)
    $0.setImage(.icPause24, for: .selected)
    $0.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
  }
  
  // MARK: - Setup Methods
  
  override func setUI() {
    addSubviews(imageView, playButton, rankStack, infoStack,)
    
    rankStack.addArrangedSubviews(rankLabel, rankChangeLabel)
    infoStack.addArrangedSubviews(titleLabel, artistLabel)
  }
  
  override func setLayout() {
    imageView.snp.makeConstraints {
      $0.leading.verticalEdges.equalToSuperview()
      $0.width.equalTo(imageView.snp.height)
    }
    
    rankStack.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalTo(imageView.snp.trailing)
      $0.width.equalTo(40)
    }
    
    infoStack.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalTo(rankStack.snp.trailing)
      $0.trailing.equalTo(playButton.snp.leading).inset(-25)
    }
    
    playButton.snp.makeConstraints {
      $0.size.equalTo(24)
      $0.centerY.trailing.equalToSuperview()
    }
  }
  
  func configure(_ data: HomeDTO, row rank: Int) {
    rankLabel.text = "\(rank + 1)"
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
