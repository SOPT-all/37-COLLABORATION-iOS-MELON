//
//  ForYouViewController.swift
//  Melon_iOS
//
//  Created by 조영서 on 11/15/25.
//

import UIKit

import SnapKit
import Then

final class ForYouViewController: BaseViewController, UICollectionViewDelegate {
    
    // MARK: - Properties
    
    private let forYouView = ForYouView()
    
    var basedTasteItems = RecommendationItem.basedTaste
    var basedSituationItems = RecommendationItem.basedSituation
    let customSongItems = CustomSongDTO.mockData
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setMallangListenButtonAction()
        forYouView.customSongView.pageControl.currentPage = 0
    }
    
    // MARK: - Setup Methods
    
    override func setUI() {
        view.addSubview(forYouView)
    }
    
    override func setLayout() {
        forYouView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setupCollectionView() {
        let rv = forYouView.recommendView
        let cv = forYouView.customSongView.collectionView
        
        rv.tasteCollectionView.delegate = self
        rv.tasteCollectionView.dataSource = self
        rv.situationCollectionView.delegate = self
        rv.situationCollectionView.dataSource = self
        
        cv.delegate = self
        cv.dataSource = self
    }
    
    // MARK: - Private Methods
    
    private func setMallangListenButtonAction () {
        forYouView.cardView.mallangListenButtonAction = { [weak self] in
            let toast = ToastMessage()
            self?.view.addSubview(toast)
            toast.configure(action: {
                
            })
            toast.show()
        }
    }
}

// MARK: - Extension

extension ForYouViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == forYouView.customSongView.collectionView {
            return customSongItems.count / 3
        }
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let rv = forYouView.recommendView
        let cv = forYouView.customSongView.collectionView
        
        if collectionView == rv.tasteCollectionView {
            return basedTasteItems.count
        } else if collectionView == rv.situationCollectionView {
            return basedSituationItems.count
        }
        else if collectionView == cv {
            return 3
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cv = forYouView.customSongView.collectionView
        
        if collectionView == cv {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CustomSongViewCell.reuseIdentifier,
                for: indexPath
            ) as? CustomSongViewCell else {
                return UICollectionViewCell()
            }
            
            cell.delegate = self
            
            let index = indexPath.section * 3 + indexPath.item
            let item = customSongItems[index]
            
            cell.configure(
                title: item.title,
                artist: item.artist,
                imageUrl: item.imageUrl,
                itemIndex: indexPath.item
            )
            return cell
        }
        
        else {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RecommendViewCell.reuseIdentifier,
                for: indexPath
            ) as? RecommendViewCell else {
                return UICollectionViewCell()
            }
            
            let recommendView = forYouView.recommendView
            let item: RecommendationItem
            
            if collectionView == recommendView.tasteCollectionView {
                item = basedTasteItems[indexPath.item]
            } else if collectionView == recommendView.situationCollectionView {
                item = basedSituationItems[indexPath.item]
            } else {
                return UICollectionViewCell()
            }
            
            cell.delegate = self
            
            cell.configure(
                content: item.content,
                hasImage: item.hasImage,
                isSelected: item.isSelected
            )
            return cell
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == forYouView.customSongView.collectionView {
            
            let pageWidth = UIScreen.main.bounds.width - 64.0
            let contentOffsetX = scrollView.contentOffset.x
            
            let currentPage = Int(round(contentOffsetX / pageWidth))
            
            forYouView.customSongView.pageControl.currentPage = currentPage
        }
    }
}

extension ForYouViewController: RecommendViewCellDelegate {
    func chipTapped(in cell: RecommendViewCell) {
        let rv = forYouView.recommendView
        
        if let indexPath = rv.tasteCollectionView.indexPath(for: cell) {
            var item = basedTasteItems[indexPath.item]
            item.isSelected.toggle()
            basedTasteItems[indexPath.item] = item
            rv.tasteCollectionView.reloadItems(at: [indexPath])
        }
        else if let indexPath = rv.situationCollectionView.indexPath(for: cell) {
            var item = basedSituationItems[indexPath.item]
            item.isSelected.toggle()
            basedSituationItems[indexPath.item] = item
            rv.situationCollectionView.reloadItems(at: [indexPath])
        }
    }
}

extension ForYouViewController: CustomSongViewCellDelegate {
    func mixUpButtonTapped(in cell: CustomSongViewCell) {
        
        let toast = ToastMessage()
        self.view.addSubview(toast)
        toast.configure(action: {
            
        })
        toast.show()
    }
}

struct RecommendationItem {
    let content: String
    let hasImage: Bool
    var isSelected: Bool = false
    
    static let basedTaste: [RecommendationItem] = [
        RecommendationItem(content: "감성보컬", hasImage: false),
        RecommendationItem(content: "pH-1", hasImage: true),
        RecommendationItem(content: "그르부있는비트", hasImage: false)
    ]
    
    static let basedSituation: [RecommendationItem] = [
        RecommendationItem(content: "드라이브", hasImage: false),
        RecommendationItem(content: "집중할 때", hasImage: false),
        RecommendationItem(content: "조용한 밤", hasImage: false)
    ]
}
