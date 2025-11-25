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
    
    // MARK: - UI Components
    
    private let melonLogo = UIImageView().then {
        $0.image = UIImage.icLogo
    }
    
    private let perkButton = UIImageView().then {
        $0.image = .icPerk
    }
    
    private let cashButton = UIImageView().then {
        $0.image = UIImage(named: "ic_cash")
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
    }
    
    // MARK: - Setup Methods
    
    override func setUI() {
        addSubviews(melonLogo, perkButton, cashButton)
    }
    
    override func setLayout() {
        melonLogo.snp.makeConstraints {
            $0.size.equalTo(32)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }
        
        cashButton.snp.makeConstraints {
            $0.size.equalTo(32)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
        }
        
        perkButton.snp.makeConstraints {
            $0.height.equalTo(20)
            $0.width.equalTo(57)
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(cashButton.snp.leading).offset(-16)
        }
    }
}
