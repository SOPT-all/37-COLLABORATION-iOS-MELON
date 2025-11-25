//
//  PersonalizedView.swift
//  Melon_iOS
//
//  Created by mandoo on 11/24/25.
//

import UIKit

import SnapKit
import Then

final class RecommendView: BaseUIView {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel().then {
        $0.text = "오늘의 추천"
        $0.font = .pretendard(.heading_b_20)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private lazy var reloadStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = 3.82
    }
    
    private let reloadLabel = UILabel().then {
        $0.text = "새로고침"
        $0.font = .pretendard(.caption_r_12)
        $0.textColor = .gray200
    }
    
    private let reloadIconImageView = UIImageView().then {
        $0.image = .icRefresh
    }
    
    private let basedTasteLabel = UILabel().then {
        $0.text = "내 취향 기반"
        $0.font = .pretendard(.caption_r_12)
        $0.textColor = .gray200
    }
    
    private let basedSituationLabel = UILabel().then {
        $0.text = "상황 기반"
        $0.font = .pretendard(.caption_r_12)
        $0.textColor = .gray200
    }
    
    let tasteCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.estimatedItemSize = CGSize(width: 100, height: 48)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.register(RecommendViewCell.self, forCellWithReuseIdentifier: RecommendViewCell.reuseIdentifier)
        
        return cv
    }()
    
    let situationCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.estimatedItemSize = CGSize(width: 100, height: 48)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.register(RecommendViewCell.self, forCellWithReuseIdentifier: RecommendViewCell.reuseIdentifier)
        
        return cv
    }()
    
    // MARK: - Setup Methods
    
    override func setUI() {
        
        reloadStackView.addArrangedSubviews(reloadIconImageView, reloadLabel)
        
        addSubviews(
            titleLabel,
            reloadStackView,
            basedTasteLabel,
            tasteCollectionView,
            basedSituationLabel,
            situationCollectionView
        )
        
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = UIColor.line.cgColor
        clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.gradient3()
    }
    
    override func setLayout() {
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(12)
            $0.top.equalToSuperview().inset(18)
        }
        
        reloadIconImageView.snp.makeConstraints {
            $0.size.equalTo(16)
        }
        
        reloadStackView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(12)
            $0.centerY.equalTo(titleLabel)
            $0.height.equalTo(30)
        }
        
        basedTasteLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(12)
            $0.top.equalTo(titleLabel.snp.bottom).offset(24)
        }
        
        tasteCollectionView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(12)
            $0.top.equalTo(basedTasteLabel.snp.bottom).offset(8)
            $0.height.equalTo(48)
        }
        
        basedSituationLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(12)
            $0.top.equalTo(tasteCollectionView.snp.bottom).offset(16)
        }
        
        situationCollectionView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(12)
            $0.top.equalTo(basedSituationLabel.snp.bottom).offset(8)
            $0.height.equalTo(48)
            $0.bottom.equalToSuperview().inset(18)
        }
    }
}
