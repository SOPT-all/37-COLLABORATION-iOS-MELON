//
//  NavigationItem.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/18/25.
//

import UIKit

import SnapKit
import Then

final class NavigationItemCell: BaseUICollectionViewCell, ReuseIdentifiable {
  
  private lazy var melonLogo = UIImageView().then {
    $0.image = UIImage.icLogo
  }
  
  private lazy var perkButton = UIImageView().then {
    $0.image = .icPerk
  }
  
  private lazy var cashButton = UIImageView().then {
    $0.image = UIImage(named: "ic_cash")
    $0.contentMode = .scaleAspectFit
    $0.clipsToBounds = true
  }
    
  override func setUI() {
    addSubviews(melonLogo, perkButton, cashButton)
  }
  
  override func setLayout() {
    melonLogo.snp.makeConstraints {
      $0.size.equalTo(32)
      $0.centerY.equalToSuperview()
      $0.leading.equalToSuperview().offset(16)
    }
    
    cashButton.snp.makeConstraints { make in
      make.size.equalTo(32)
      make.centerY.equalToSuperview()
      make.trailing.equalToSuperview().inset(16)
    }
    
    perkButton.snp.makeConstraints { make in
      make.height.equalTo(20)
      make.width.equalTo(57)
      make.centerY.equalToSuperview()
      make.trailing.equalTo(cashButton.snp.leading).inset(-16)
    }
  }
  
}
