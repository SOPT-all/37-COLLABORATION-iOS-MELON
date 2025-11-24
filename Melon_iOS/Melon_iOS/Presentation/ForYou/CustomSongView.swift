//
//  CustomSongView.swift
//  Melon_iOS
//
//  Created by mandoo on 11/24/25.
//

import UIKit

import SnapKit
import Then

final class CustomSongView: BaseUIView {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel().then {
        $0.text = "맞춤 선곡"
        $0.font = .pretendard(.heading_b_20)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    let pageControl = UIPageControl().then {
        $0.numberOfPages = 4
        $0.currentPage = 0
        $0.pageIndicatorTintColor = UIColor.white.withAlphaComponent(0.5)
        $0.currentPageIndicatorTintColor = .white
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width-64, height: 60)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.register(CustomSongViewCell.self, forCellWithReuseIdentifier: CustomSongViewCell.reuseIdentifier)
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.alwaysBounceHorizontal = true
        return cv
    }()
    
    // MARK: - Setup Methods
    
    override func setUI() {
        
        addSubviews(
            titleLabel,
            pageControl,
            collectionView
        )
        
        self.backgroundColor = .customblue
        
        layer.cornerRadius = 8
        clipsToBounds = true
    }
    
    override func setLayout() {
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(12)
            $0.top.equalToSuperview().inset(12)
        }
        
        pageControl.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalTo(titleLabel)
            $0.height.equalTo(3)
        }
        
        collectionView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(12)
            $0.top.equalTo(titleLabel.snp.bottom).offset(24.5)
            $0.height.equalTo(212)
            $0.bottom.equalToSuperview().inset(9.5)
        }
    }
    
    //MARK: - Private Methods
    
    func updatIndicator(currentPage: Int) {
        pageControl.currentPage = currentPage
    }
}
