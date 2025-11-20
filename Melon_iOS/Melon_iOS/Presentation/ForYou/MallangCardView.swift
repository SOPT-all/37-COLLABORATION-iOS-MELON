//
//  MallangCardView.swift
//  Melon_iOS
//
//  Created by mandoo on 11/19/25.
//

import UIKit

import SnapKit
import Then

final class MallangCardView: BaseUIView {
    
    // MARK: - Properties
    
    var mallangListenButtonAction: (() -> Void)?
    
    private let mallangCardImageView = UIImageView().then {
        $0.image = UIImage(named: "card_1_ios")
    }
    
    private let artistMixCardImageView = UIImageView().then {
        $0.image = UIImage(named: "card_4_ios")
    }
    
    private lazy var mallangListenButton = CTAButton(
        style: .filledWhite,
        label: "추천 바로 듣기",
        font: .pretendard(.body_b_14),
        image: .icMixup32,
        imageTextSpacing: 2,
        action: { [weak self] in
            self?.mallangListenButtonAction?()
        }
    )
    
    private lazy var setTasteButton = CTAButton(
        style: .bordered,
        label: "취향 설정하기",
        font: .pretendard(.body_r_14),
    )
    
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
        backgroundColor = .clear
        
        addSubviews(
            mallangCardImageView,
            artistMixCardImageView,
            mallangListenButton,
            setTasteButton
        )
    }
    
    override func setLayout() {
        
        mallangCardImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(335)
        }
        
        artistMixCardImageView.snp.makeConstraints {
            $0.top.equalTo(mallangCardImageView.snp.bottom).offset(28)
            $0.horizontalEdges.equalToSuperview()
        }
        
        mallangListenButton.snp.makeConstraints {
            $0.centerX.equalTo(mallangCardImageView)
            $0.horizontalEdges.equalTo(mallangCardImageView).inset(15)
            $0.bottom.equalTo(mallangCardImageView.snp.bottom).inset(12.5)
        }
        
        setTasteButton.snp.makeConstraints {
            $0.centerX.equalTo(mallangCardImageView)
            $0.horizontalEdges.equalTo(artistMixCardImageView).inset(15)
            $0.bottom.equalTo(artistMixCardImageView.snp.bottom).inset(14.88)
        }
    }
}
