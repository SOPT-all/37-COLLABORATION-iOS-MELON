//
//  PreferenceItemCell.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/18/25.
//

import UIKit

import SnapKit
import Then

final class PreferenceItemCell: BaseUICollectionViewCell, ReuseIdentifiable {
  
  private lazy var eventBannerView = EventBannerView()
  
  private lazy var preferenceSongView = PreferenceSongView()
  
  override func setUI() {
    addSubviews(eventBannerView, preferenceSongView)
  }
  
  override func setLayout() {
    
    eventBannerView.snp.makeConstraints {
      $0.top.horizontalEdges.equalToSuperview()
      $0.height.equalTo(48)
    }
    
    preferenceSongView.snp.makeConstraints {
      $0.top.equalTo(eventBannerView.snp.bottom).offset(20)
      $0.horizontalEdges.equalToSuperview()
      $0.height.equalTo(95)
    }
  }
  
}

final class EventBannerView : UIView {
  
  private lazy var eventCircleView = UIView().then {
    $0.backgroundColor = .gray700
    $0.clipsToBounds = true
    $0.layer.cornerRadius = 16
  }
  
  private lazy var eventIconView = UIImageView().then {
    $0.image = .icBell
    $0.contentMode = .scaleAspectFit
    $0.backgroundColor = .gray700
  }
  
  private lazy var eventTitleLabel = UILabel().then {
    $0.text = "지금 참여하면 MMA 초대권 선물"
    $0.font = UIFont.pretendard(.caption_r_12)
    $0.textColor = .white
  }
  
  private lazy var eventSubLabel = UILabel().then {
    $0.text = "최애 입덕 포인트 남기고 실물 영접하러 가자!"
    $0.font = UIFont.pretendard(.caption_r_12)
    $0.textColor = .gray400
  }
  
  private lazy var deleteButton = UIButton().then {
    $0.setImage(.icX, for: .normal)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    setLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setUI() {
    backgroundColor = .gray500
    clipsToBounds = true
    layer.cornerRadius = 4
    
    addSubviews(
      eventCircleView,
      eventIconView,
      eventTitleLabel,
      eventSubLabel,
      deleteButton)
  }
  
  private func setLayout() {
    
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

final class PreferenceSongView: UIView {
  
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
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    setLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setUI() {
    backgroundColor = .gray500
    clipsToBounds = true
    layer.cornerRadius = 4
    
    addSubviews(coverImageView, playButton, infoStack)
    
    infoStack.addArrangedSubviews(titleLabel, songNameLabel, artistNameLabel)
  }
  
  private func setLayout() {
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
  
  @objc private func playButtonTapped() {
    playButton.isSelected.toggle()
  }
}

import SwiftUI
#Preview {
  HomeViewController()
}
