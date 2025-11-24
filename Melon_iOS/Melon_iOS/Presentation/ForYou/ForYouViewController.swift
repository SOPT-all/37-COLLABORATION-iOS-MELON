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
    
    let basedTasteItems = RecommendationItem.basedTaste
    let basedSituationItems = RecommendationItem.basedSituation
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setMallangListenButtonAction()
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
//        let cv = forYouView.customSongView.collectionView
        
        rv.tasteCollectionView.delegate = self
        rv.tasteCollectionView.dataSource = self
        rv.situationCollectionView.delegate = self
        rv.situationCollectionView.dataSource = self
        
//        cv.delegate = self
//        cv.dataSource = self
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

// MARK: - UICollectionViewDataSource

extension ForYouViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let rv = forYouView.recommendView
//        let cv = forYouView.customSongView.collectionView
        
        if collectionView == rv.tasteCollectionView {
            return basedTasteItems.count
        } else if collectionView == rv.situationCollectionView {
            return basedSituationItems.count
        }
//        else if collectionView == cv {
//            return customSongItems.count
//        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cv = forYouView.customSongView.collectionView
        
//        if collectionView == cv {
//            guard let cell = collectionView.dequeueReusableCell(
//                withReuseIdentifier: CustomSongViewCell.reuseIdentifier,
//                for: indexPath
//            ) as? CustomSongViewCell else {
//                return UICollectionViewCell()
//            }
//            let item = customSongItems[indexPath.item]
//            
//            cell.configure(
//                title: item.title,
//                artist: item.artist,
//                imageUrl: item.imageUrl
//            )
//            return cell
//        }
        
//        else {
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
            
            cell.configure(content: item.content, hasImage: item.hasImage)
            return cell
//        }
    }
}
