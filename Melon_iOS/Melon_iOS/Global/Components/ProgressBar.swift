//
//  ProgressBar.swift
//  Melon_iOS
//
//  Created by 조영서 on 11/16/25.
//

import UIKit

import SnapKit
import Then

final class ProgressBar: UIView {
    
    // MARK: - Style
    
    enum Style {
        case normal
        case mixup
    }
    
    private let style: Style
    
    // MARK: - UI Components
    
    private let remainingProgressView = UIView().then {
        $0.backgroundColor = .gray500
    }
    
    private let filledProgressView = UIView().then {
        $0.backgroundColor = .primary
    }
    
    private let backIconView = UIImageView().then {
        $0.tintColor = .white
        $0.contentMode = .scaleAspectFit
    }
    
    private let playIconView = UIImageView().then {
        $0.tintColor = .white
        $0.contentMode = .scaleAspectFit
    }
    
    private let frontIconView = UIImageView().then {
        $0.tintColor = .white
        $0.contentMode = .scaleAspectFit
    }
    
    private let iconStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
    }
        
    private let musicTitleLabel = UILabel().then {
        $0.font = .pretendard(.body_m_14)
        $0.textColor = .white
        $0.text = "Blue Valentine"
    }
    
    private let artistLabel = UILabel().then {
        $0.font = .pretendard(.caption_r_12)
        $0.textColor = .gray300
        $0.text = "NMIXX"
    }
    
    private let musicInfoStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.spacing = 2
    }
    
    private let musicListIcon = UIImageView().then {
        $0.tintColor = .white
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "ic_playmenu")?.withRenderingMode(.alwaysTemplate)
    }
        
    private let settingIcon = UIImageView().then {
        $0.tintColor = .white
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "ic_settings")?.withRenderingMode(.alwaysTemplate)
    }
    
    private let albumImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 4
        $0.image = UIImage(named: "img_mixup1")
    }
    
    // MARK: - Init
    
    init(style: Style) {
        self.style = style
        super.init(frame: .zero)
        
        setupUI()
        setupLayout()
        configureIcons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Methods
    
    private func setupUI() {
        
        iconStackView.addArrangedSubviews(backIconView, playIconView, frontIconView)
        
        addSubviews(
            remainingProgressView,
            filledProgressView
        )
        
        switch style {
            
        case .normal:
            backgroundColor = .background
            
            iconStackView.spacing = 6
            
            musicInfoStackView.addArrangedSubviews(musicTitleLabel, artistLabel)
            
            addSubviews(
                musicInfoStackView,
                iconStackView,
                musicListIcon
            )
            
        case .mixup:
            backgroundColor = .clear
            
            iconStackView.spacing = 20
            
            addSubviews(
                iconStackView,
                settingIcon,
                albumImageView
            )
        }
    }
    
    private func setupLayout() {
        
        remainingProgressView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(2)
        }
        
        filledProgressView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.height.equalTo(2)
            $0.width.equalTo(225)
        }
        
        if style == .normal {
            
            musicInfoStackView.snp.makeConstraints {
                $0.top.equalTo(remainingProgressView.snp.bottom).offset(10)
                $0.leading.equalToSuperview().inset(20)
            }
            
            musicListIcon.snp.makeConstraints {
                $0.centerY.equalTo(musicInfoStackView)
                $0.trailing.equalToSuperview().inset(8)
                $0.size.equalTo(40)
            }
            
            iconStackView.snp.makeConstraints {
                $0.centerY.equalTo(musicListIcon)
                $0.trailing.equalTo(musicListIcon.snp.leading).offset(-4)
            }
            
            [backIconView, playIconView, frontIconView].forEach {
                $0.snp.makeConstraints { $0.size.equalTo(32) }
            }
        }
        
        if style == .mixup {
            
            iconStackView.snp.makeConstraints {
                $0.top.equalTo(remainingProgressView.snp.bottom).offset(6)
                $0.centerX.equalToSuperview()
            }
            
            settingIcon.snp.makeConstraints {
                $0.centerY.equalTo(iconStackView)
                $0.trailing.equalTo(iconStackView.snp.leading).offset(-39)
            }
            
            albumImageView.snp.makeConstraints {
                $0.centerY.equalTo(iconStackView)
                $0.leading.equalTo(iconStackView.snp.trailing).offset(33)
                $0.size.equalTo(30)
            }
            
            playIconView.snp.makeConstraints {
                $0.size.equalTo(64)
            }
            
            [backIconView, frontIconView].forEach {
                $0.snp.makeConstraints { $0.size.equalTo(48) }
            }
        }
    }
    
    // MARK: - Private Methods
    
    private func configureIcons() {
        switch style {
        case .normal:
            backIconView.image = UIImage(named: "ic_back")?.withRenderingMode(.alwaysTemplate)
            playIconView.image = UIImage(named: "ic_play")?.withRenderingMode(.alwaysTemplate)
            frontIconView.image = UIImage(named: "ic_front")?.withRenderingMode(.alwaysTemplate)
            
        case .mixup:
            backIconView.image = UIImage(named: "ic_big_back")?.withRenderingMode(.alwaysTemplate)
            playIconView.image = UIImage(named: "ic_big_play")?.withRenderingMode(.alwaysTemplate)
            frontIconView.image = UIImage(named: "ic_big_front")?.withRenderingMode(.alwaysTemplate)
        }
    }
}
