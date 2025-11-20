//
//  EventBannerView.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/18/25.
//

import UIKit

import SnapKit
import Then

final class EventBannerView : BaseUIView {
  
  // MARK: - UI Components
  private let cardView = UIView().then {
    $0.backgroundColor = .gray500
    $0.clipsToBounds = true
    $0.layer.cornerRadius = 4
  }
  
  private let eventCircleView = UIView().then {
    $0.backgroundColor = .gray700
    $0.clipsToBounds = true
    $0.layer.cornerRadius = 16
  }
  
  private let eventIconView = UIImageView().then {
    $0.image = .icBell
    $0.contentMode = .scaleAspectFit
    $0.backgroundColor = .gray700
  }
  
  private let eventTitleLabel = UILabel().then {
    $0.text = "지금 참여하면 MMA 초대권 선물"
    $0.font = UIFont.pretendard(.caption_r_12)
    $0.textColor = .white
  }
  
  private let eventSubLabel = UILabel().then {
    $0.text = "최애 입덕 포인트 남기고 실물 영접하러 가자!"
    $0.font = UIFont.pretendard(.caption_r_12)
    $0.textColor = .gray400
  }
  
  private let deleteButton = UIButton().then {
    $0.setImage(.icX, for: .normal)
  }
  
  // MARK: - Setup Methods
  
  override func setUI() {
    backgroundColor = .background
    
    addSubview(cardView)
    cardView.addSubviews(
      eventCircleView,
      eventIconView,
      eventTitleLabel,
      eventSubLabel,
      deleteButton)
  }
  
  override func setLayout() {
    cardView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    
    eventCircleView.snp.makeConstraints {
      $0.size.equalTo(32)
      $0.leading.equalToSuperview().offset(12)
      $0.centerY.equalToSuperview()
    }
    
    eventIconView.snp.makeConstraints {
      $0.center.equalTo(eventCircleView)
    }
    
    eventTitleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(8)
      $0.leading.equalTo(eventCircleView.snp.trailing).offset(4)
    }
    
    eventSubLabel.snp.makeConstraints {
      $0.bottom.equalToSuperview().inset(8)
      $0.leading.equalTo(eventCircleView.snp.trailing).offset(4)
    }
    
    deleteButton.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.trailing.equalToSuperview().inset(8)
    }
  }
}
