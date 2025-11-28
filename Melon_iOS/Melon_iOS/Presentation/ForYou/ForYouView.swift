//
//  ForYouView.swift
//  Melon_iOS
//
//  Created by 조영서 on 11/15/25.
//

import UIKit

import SnapKit
import Then

final class ForYouView: BaseUIView {
    
    // MARK: - UI Components
    
    private let statusBarBgView = UIView().then {
        $0.backgroundColor = .background
    }
    
    private let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
        $0.alwaysBounceVertical = true
        $0.backgroundColor = .background
    }
    
    private let contentView = UIView()
    
    private let forYouLabel = UILabel().then {
        $0.font = .pretendard(.title_b_24)
        $0.text = "ForYou"
        $0.textColor = .white
    }
    
    let cardView = MallangCardView()
    let recommendView = RecommendView()
    let progressBar = ProgressBar(style: .normal)
    let customSongView = CustomSongView()
    
    private let latestAlbumLabel = UILabel().then {
        $0.font = .pretendard(.caption_r_12)
        $0.text = "팬맺은 아티스트의 최신앨범"
        $0.textColor = .gray200
    }
    
    let latestAlbumView = LatestAlbumView()
    
    // MARK: - Setup Methods
    
    override func setUI() {
        backgroundColor = .background
        
        addSubviews(scrollView, statusBarBgView, progressBar)
        scrollView.addSubview(contentView)
        
        contentView.addSubviews(
            forYouLabel,
            cardView,
            recommendView,
            customSongView,
            latestAlbumLabel,
            latestAlbumView
        )
    }
    
    override func setLayout() {
        
        statusBarBgView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.top)
        }
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView.snp.width)
        }
        
        forYouLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(contentView.safeAreaLayoutGuide).offset(6)
            $0.height.equalTo(36)
        }
        
        cardView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(forYouLabel.snp.bottom).offset(8)
        }
        
        recommendView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(cardView.snp.bottom).offset(28)
        }
        
        customSongView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(recommendView.snp.bottom).offset(28)
            $0.height.equalTo(288)
        }
        
        latestAlbumLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(customSongView.snp.bottom).offset(28)
            $0.height.equalTo(18)
        }
        
        latestAlbumView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(latestAlbumLabel.snp.bottom).offset(8)
            $0.height.equalTo(440)
            $0.bottom.equalToSuperview().inset(100)
        }
        
        progressBar.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide)
            $0.height.equalTo(60)
        }
    }
}
