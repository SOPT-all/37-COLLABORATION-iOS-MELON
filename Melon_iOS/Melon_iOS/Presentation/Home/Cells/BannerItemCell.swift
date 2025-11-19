//
//  BannerItemCell.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/19/25.
//

import UIKit

import SnapKit
import Then

final class BannerItemCell: BaseUICollectionViewCell, ReuseIdentifiable {
  
  // MARK: - UI Components
  
  private lazy var cardView = UIView().then {
    $0.clipsToBounds = true
    $0.layer.cornerRadius = 4
  }
  
  private lazy var promotionTitle = UILabel().then {
    $0.text = ""
    $0.font = UIFont.pretendard(.body_r_14)
    $0.textColor = .gray200
  }
  
  private lazy var imageView = UIImageView().then {
    $0.contentMode = .scaleAspectFill
    $0.image = .imgBanner1
  }
  
  private lazy var infoStack = UIStackView().then {
    $0.axis = .vertical
    $0.alignment = .leading
    $0.spacing = 4
  }
  
  private lazy var capsuleView = UIView().then {
    $0.clipsToBounds = true
    $0.layer.cornerRadius = 8
    $0.layer.borderWidth = 1
    $0.layer.borderColor = UIColor.white.cgColor
  }
  
  private lazy var capsuleLabel = UILabel().then {
    $0.text = "Melon Ticket"
    $0.textColor = .white
    
    $0.textAlignment = .center
    
    $0.font = UIFont.pretendard(.caption_m_10)
  }
  
  private lazy var titleLabel = UILabel().then {
    $0.textColor = .white
    $0.font = UIFont.pretendard(.body_m_14)
    
    $0.text = "우즈 CONCERT"
  }
  
  private lazy var subTitleLabel = UILabel().then {
    $0.textColor = .white
    $0.font = UIFont.pretendard(.caption_r_12)
    
    $0.text = "멜론티켓에서 예매하기"
  }
  
  // MARK: - Setup Methods
  
  override func setUI () {
    addSubviews(cardView, promotionTitle)
    
    cardView.addSubviews(imageView, infoStack, capsuleLabel)
    
    infoStack.addArrangedSubviews(capsuleView, titleLabel, subTitleLabel)
  }
  
  override func setLayout() {
    
    cardView.snp.makeConstraints {
      $0.bottom.horizontalEdges.equalToSuperview()
      $0.height.equalTo(95)
    }
    
    promotionTitle.snp.makeConstraints {
      $0.top.leading.equalToSuperview()
    }
    
    imageView.snp.makeConstraints {
      $0.size.equalTo(95)
      $0.leading.bottom.equalToSuperview()
    }
    
    infoStack.snp.makeConstraints {
      $0.centerY.equalTo(imageView)
      $0.leading.equalTo(imageView.snp.trailing).offset(15.5)
    }
    
    capsuleView.snp.makeConstraints {
      $0.width.equalTo(72)
      $0.height.equalTo(16)
    }
    
    capsuleLabel.snp.makeConstraints {
      $0.center.equalTo(capsuleView)
    }
  }
  
  func configure(_ data: BannerDTO) {
    titleLabel.text = data.title
    subTitleLabel.text = data.subtitle
    promotionTitle.text = data.promotion
    capsuleLabel.text = data.capsuleTitle
    imageView.image = data.image
    cardView.backgroundColor = data.backgroundColor
  }
  
}
