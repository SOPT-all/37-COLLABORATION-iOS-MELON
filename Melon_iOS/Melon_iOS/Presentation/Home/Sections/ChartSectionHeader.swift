//
//  ChartSectionHeader.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/18/25.
//

import UIKit

import SnapKit
import Then

final class ChartSectionHeader: BaseUICollectionReusableView, ReuseIdentifiable,
                                UICollectionViewDelegate {
    
    // MARK: - Properties
    
    private let chartCategories: [String] = ["TOP 100", "HOT 100", "월드뮤직", "한강에서 즐기기 좋은 음악"]
    private let titleFrame = UIView()
    
    // MARK: - UI Components
    
    private let standardTime = UILabel().then {
        $0.font = UIFont.pretendard(.body_r_14)
        $0.textColor = .gray200
        $0.text = "오늘 10:00 기준"
    }
    
    private let label = UILabel().then {
        $0.font = UIFont.pretendard(.heading_b_20)
        $0.textColor = .white
        $0.text = "멜론차트"
    }
    
    private let chartIcon = UIImageView().then {
        $0.image = .icBar
    }
    
    private lazy var seeAllButton = UIButton().then {
        $0.setTitle("전체보기", for: .normal)
        $0.titleLabel?.font = UIFont.pretendard(.body_m_14)
        $0.setTitleColor(.gray200, for: .normal)
    }
    
    let filterChipCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 4
        layout.sectionInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .background
        collection.showsHorizontalScrollIndicator = false
        
        return collection
    }()
    
    // MARK: - Setup Methods
    
    override func setUI() {
        setCollectionView()
        addSubviews(titleFrame, filterChipCollectionView)
        titleFrame.addSubviews(standardTime, label, chartIcon, seeAllButton)
    }
    
    override func setLayout() {
        titleFrame.snp.makeConstraints {
            $0.height.equalTo(53)
            $0.top.equalToSuperview().inset(50)
            $0.horizontalEdges.equalToSuperview()
        }
        
        standardTime.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        label.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(standardTime.snp.bottom).offset(7)
        }
        
        chartIcon.snp.makeConstraints {
            $0.size.equalTo(24)
            $0.centerY.equalTo(label)
            $0.leading.equalTo(label.snp.trailing)
        }
        
        seeAllButton.snp.makeConstraints {
            $0.centerY.trailing.equalToSuperview()
        }
        
        filterChipCollectionView.snp.makeConstraints {
            $0.top.equalTo(titleFrame.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(-20)
            $0.height.equalTo(37)
        }
    }
    
    private func setCollectionView() {
        filterChipCollectionView.cellRegister(HomeChipCell.self)
        
        filterChipCollectionView.delegate = self
        filterChipCollectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ChartSectionHeader: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
            let categoryName = chartCategories[indexPath.item]
            
            let label = UILabel().then {
                $0.font = UIFont.pretendard(.body_r_14)
                $0.text = categoryName
                $0.textColor = .white
                $0.sizeToFit()
            }
            
            let cellWidth = label.frame.width + HomeChipCell.horizontalPadding * 2
            let cellHeight: CGFloat = 37
            
            return CGSize(width: cellWidth, height: cellHeight)
        }
}

// MARK: - UICollectionViewDataSource

extension ChartSectionHeader: UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
            return chartCategories.count
        }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(HomeChipCell.self, for: indexPath)
            if indexPath.row == 0 {
                cell.selected()
            }
            cell.configure(with: chartCategories[indexPath.row])
            return cell
        }
}
