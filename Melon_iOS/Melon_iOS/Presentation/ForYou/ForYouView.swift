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
    
    // MARK: - Properties
    
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
    let progressBar = ProgressBar(style: .normal)
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Methods
    
    override func setUI() {
        backgroundColor = .background
        
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        addSubview(contentView)
        
        contentView.addSubviews(
            forYouLabel,
            cardView,
            progressBar,
        )
    }
    
    override func setLayout() {
        
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
            $0.bottom.equalToSuperview().inset(20)
        }
        
        progressBar.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide)
            $0.height.equalTo(60)
        }
    }
}
