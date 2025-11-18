//
//  Latest.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/18/25.
//

import UIKit

import SnapKit
import Then

final class LatestSectionHeader: UICollectionReusableView {
  
  enum LatestMusicButtonType {
    case all
    case domestic
    case overseas
  }
  
  private var action: ((LatestMusicButtonType) -> Void)?
  
  let label = UILabel().then {
    $0.font = .systemFont(ofSize: 20, weight: .bold)
    $0.text = "최신음악"
  }
  
  private lazy var allButon = UIButton().then {
    $0.setTitle("전체", for: .normal)
    $0.setTitleColor(UIColor.darkGray, for: .normal)
    $0.setTitleColor(UIColor.green, for: .selected)
    $0.addTarget(self, action: #selector(didTapAllButton), for: .touchUpInside)
  }
  
  private lazy var domesticButton = UIButton().then {
    $0.setTitle("국내", for: .normal)
    $0.setTitleColor(UIColor.darkGray, for: .normal)
    $0.setTitleColor(UIColor.green, for: .selected)
    $0.addTarget(self, action: #selector(didTapDomesticButton), for: .touchUpInside)
  }
  
  private lazy var overseasButton = UIButton().then {
    $0.setTitle("해외", for: .normal)
    $0.setTitleColor(UIColor.darkGray, for: .normal)
    $0.setTitleColor(UIColor.green, for: .selected)
    $0.addTarget(self, action: #selector(didTapOverseasButton), for: .touchUpInside)
  }
  
  private lazy var seeAllButton = UIButton().then {
    $0.setTitle("전체보기", for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
    $0.setTitleColor(.darkGray, for: .normal)
  }
  
  func configure(action: ((LatestMusicButtonType) -> Void)? = nil) {
    self.action = action
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(label)
    addSubview(allButon)
    addSubview(domesticButton)
    addSubview(overseasButton)
    addSubview(seeAllButton)
    label.snp.makeConstraints {
      $0.centerY.leading.equalToSuperview()
    }
    
    allButon.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalTo(label.snp.trailing).offset(10)
    }
    
    domesticButton.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalTo(allButon.snp.trailing).offset(10)
    }
    
    overseasButton.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalTo(domesticButton.snp.trailing).offset(10)
    }
    
    seeAllButton.snp.makeConstraints {
      $0.centerY.trailing.equalToSuperview()
    }
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc private func didTapAllButton() {
    allButon.isSelected.toggle()
    domesticButton.isSelected = false
    overseasButton.isSelected = false
    self.action!(.all)
  }
  
  @objc private func didTapDomesticButton() {
    domesticButton.isSelected.toggle()
    allButon.isSelected = false
    overseasButton.isSelected = false
    self.action!(.domestic)
  }
  
  @objc private func didTapOverseasButton() {
    overseasButton.isSelected.toggle()
    allButon.isSelected = false
    domesticButton.isSelected = false
    self.action!(.overseas)
  }
}
