//
//  MixUpListView.swift
//  Melon_iOS
//
//  Created by 조영서 on 11/17/25.
//

import UIKit

import SnapKit
import Then

final class MixUpListView: BaseUIView {
    
    // MARK: - UI Components
    
    private let mixupListTitleLabel = UILabel().then {
        $0.text = "믹스업 목록"
        $0.font = .pretendard(.body_sb_16)
        $0.textColor = .white
        $0.textAlignment = .left
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 42)

        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    
    // MARK: - Setup Methods
    
    override func setUI() {
        backgroundColor = .clear
        addSubviews(mixupListTitleLabel, collectionView)
    }
    
    override func setLayout() {
        
        mixupListTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(24)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(mixupListTitleLabel.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
