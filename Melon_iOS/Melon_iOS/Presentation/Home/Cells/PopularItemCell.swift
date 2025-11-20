//
//  PopularItemCell.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/18/25.
//

import UIKit

import SnapKit
import Then

final class PopularItemCell: BaseUICollectionViewCell, ReuseIdentifiable {
  
  // MARK: - Properties
  
  private var action: (() -> Void)?
  
  // MARK: - UI Components
  
  private let imageView = UIImageView().then {
    $0.contentMode = .scaleAspectFill
    $0.clipsToBounds = true
    $0.backgroundColor = .background2
    $0.layer.cornerRadius = 4
    $0.image = .imgMixup4
  }
  
  private let infoStackView = UIStackView().then {
    $0.axis = .vertical
    $0.spacing = 4
  }
  
  private let categoryLabel = UILabel().then {
    $0.font = UIFont.pretendard(.caption_r_12)
    $0.textColor = .gray200
  }
  
  private let titleLabel = UILabel().then {
    $0.font = UIFont.pretendard(.body_r_14)
    $0.textColor = .white
  }
  
  private let artistLabel = UILabel().then {
    $0.font = UIFont.pretendard(.caption_r_12)
    $0.textColor = .gray200
  }
  
  private let mixUpButton = UIButton().then {
    $0.setImage(.icMixup36, for: .normal)
  }
  
  // MARK: - Setup Methods
  
  override func setUI() {
    mixUpButton.addTarget(self, action: #selector(mixUpButtonTapped), for: .touchUpInside)
    
    addSubviews(imageView, infoStackView, mixUpButton)
    infoStackView.addArrangedSubviews(categoryLabel, titleLabel, artistLabel)
  }
  
  override func setLayout() {
    imageView.snp.makeConstraints {
      $0.leading.verticalEdges.equalToSuperview()
      $0.width.equalTo(imageView.snp.height)
    }
    
    infoStackView.snp.makeConstraints {
      $0.leading.equalTo(imageView.snp.trailing).offset(12)
      $0.centerY.equalToSuperview()
    }
    
    mixUpButton.snp.makeConstraints {
      $0.size.equalTo(36)
      $0.trailing.equalToSuperview().inset(-12)
      $0.centerY.equalToSuperview()
    }
  }
  
  // MARK: - Actions
  
  @objc func mixUpButtonTapped() {
    action!()
  }
  
  func configure(_ data: HomeDTO, action: (() -> Void)? = nil) {
    titleLabel.text = data.title
    artistLabel.text = data.artist
    categoryLabel.text = data.category
    
    if let imageUrl = data.imageUrl, let url = URL(string: imageUrl) {
      imageView.kf.setImage(
        with: url,
        placeholder: .none,
      )} else {
        imageView.image = .none
      }
    
    self.action = action
  }
}
