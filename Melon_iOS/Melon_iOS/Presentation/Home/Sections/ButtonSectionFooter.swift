//
//  ButtonSectionFooter.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/18/25.
//

import UIKit

import SnapKit
import Then

final class ButtonSectionFooter: UICollectionReusableView {
  
  private lazy var playButton = UIButton().then {
    $0.backgroundColor = .darkGray
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(playButton)
    
    playButton.snp.makeConstraints {
      $0.centerY.horizontalEdges.equalToSuperview()
      $0.height.equalTo(44)
    }
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

