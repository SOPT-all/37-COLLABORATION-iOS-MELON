//
//  PreferenceItemCell.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/18/25.
//

import UIKit

import SnapKit
import Then

final class PreferenceItemCell: BaseUICollectionViewCell, ReuseIdentifiable {
    
    // MARK: - UI Components
    
    private let eventBannerView = EventBannerView()
    
    private let preferenceSongView = PreferenceSongView()
    
    // MARK: - Setup Methods
    
    override func setUI() {
        addSubviews(eventBannerView, preferenceSongView)
    }
    
    override func setLayout() {
        eventBannerView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(48)
        }
        
        preferenceSongView.snp.makeConstraints {
            $0.top.equalTo(eventBannerView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(95)
        }
    }
    
    func configure(_ data: PreferencedSongDTO = PreferencedSongDTO(title: "THe Day", artist: "DAY6(데이식스)", imageUrl: "https://image.bugsm.co.kr/album/images/170/5297/529710.jpg")) {
        preferenceSongView.configure(data)
    }
}
