//
//  LatestSectionHeader.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/18/25.
//

import UIKit

import SnapKit
import Then

final class LatestSectionHeader: BaseUICollectionReusableView, ReuseIdentifiable {
    
    // MARK: - Properties
    
    private var action: ((NewestArea) -> Void)?
    
    // MARK: - UI Components
    
    private let divider1 = UIView().then { $0.backgroundColor = .gray400 }
    private let divider2 = UIView().then { $0.backgroundColor = .gray400 }
    
    private let label = UILabel().then {
        $0.font = UIFont.pretendard(.heading_b_20)
        $0.textColor = .white
        $0.text = "최신음악"
    }
    
    private let allButon = UIButton().then {
        $0.isSelected = true
        $0.setTitle("전체", for: .normal)
        $0.setTitleColor(.gray200, for: .normal)
        $0.setTitleColor(.primary, for: .selected)
    }
    
    private let domesticButton = UIButton().then {
        $0.setTitle("국내", for: .normal)
        $0.setTitleColor(.gray200, for: .normal)
        $0.setTitleColor(.primary, for: .selected)
    }
    
    private let overseasButton = UIButton().then {
        $0.setTitle("해외", for: .normal)
        $0.setTitleColor(.gray200, for: .normal)
        $0.setTitleColor(.primary, for: .selected)
    }
    
    private let seeAllButton = UIButton().then {
        $0.setTitle("전체보기", for: .normal)
        $0.titleLabel?.font = UIFont.pretendard(.body_m_14)
        $0.setTitleColor(.gray200, for: .normal)
    }
    
    // MARK: - Setup Methods
    
    override func setUI() {
        allButon.addTarget(self, action: #selector(didTapAllButton), for: .touchUpInside)
        domesticButton.addTarget(self, action: #selector(didTapDomesticButton), for: .touchUpInside)
        overseasButton.addTarget(self, action: #selector(didTapOverseasButton), for: .touchUpInside)
        
        addSubviews(label, allButon, domesticButton, overseasButton, seeAllButton, divider1, divider2)
    }
    
    override func setLayout() {
        label.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview().inset(12)
        }
        
        allButon.snp.makeConstraints {
            $0.centerY.equalTo(label)
            $0.leading.equalTo(label.snp.trailing).offset(10)
        }
        
        divider1.snp.makeConstraints {
            $0.centerY.equalTo(label)
            $0.height.equalTo(10)
            $0.width.equalTo(1)
            $0.leading.equalTo(allButon.snp.trailing).offset(7)
        }
        
        domesticButton.snp.makeConstraints {
            $0.centerY.equalTo(label)
            $0.leading.equalTo(divider1.snp.trailing).offset(7)
        }
        
        divider2.snp.makeConstraints {
            $0.centerY.equalTo(label)
            $0.height.equalTo(10)
            $0.width.equalTo(1)
            $0.leading.equalTo(domesticButton.snp.trailing).offset(7)
        }
        
        overseasButton.snp.makeConstraints {
            $0.centerY.equalTo(label)
            $0.leading.equalTo(divider2.snp.trailing).offset(7)
        }
        
        seeAllButton.snp.makeConstraints {
            $0.centerY.equalTo(label)
            $0.trailing.equalToSuperview()
        }
    }
    
    // MARK: - Actions
    
    @objc private func didTapAllButton() {
        allButon.isSelected = true
        domesticButton.isSelected = false
        overseasButton.isSelected = false
        action!(.all)
    }
    
    @objc private func didTapDomesticButton() {
        allButon.isSelected = false
        domesticButton.isSelected = true
        overseasButton.isSelected = false
        action!(.kor)
    }
    
    @objc private func didTapOverseasButton() {
        allButon.isSelected = false
        domesticButton.isSelected = false
        overseasButton.isSelected = true
        action!(.int)
    }
    
    func configure(action: ((NewestArea) -> Void)? = nil) {
        self.action = action
    }
}
