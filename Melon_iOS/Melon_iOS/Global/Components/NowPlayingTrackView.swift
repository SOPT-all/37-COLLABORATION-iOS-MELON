//
//  NowPlayingTrackView.swift
//  Melon_iOS
//
//  Created by 조영서 on 11/17/25.
//

import UIKit

import SnapKit
import Then

final class NowPlayingTrackView: UIView {
    
    // MARK: - UI Components
    
    private let checkboxButton = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "ic_checkbox_default"), for: .normal)
        $0.setImage(UIImage(named: "ic_checkbox_selected"), for: .selected)
        $0.tintColor = .gray200
        $0.contentMode = .scaleAspectFit
    }
    
    private let albumImageView = UIImageView().then {
        $0.image = UIImage(named: "img_mixup9")
        $0.layer.cornerRadius = 4
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
    }
    
    private let musicTitleLabel = UILabel().then {
        $0.text = "Blue Valentine"
        $0.font = .pretendard(.body_m_14)
        $0.textColor = .primary
    }
    
    private let artistNameLabel = UILabel().then {
        $0.text = "NMIXX"
        $0.font = .pretendard(.caption_r_12)
        $0.textColor = .gray200
    }
    
    private let musicInfoStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .leading
    }
    
    private let menuIconView = UIImageView().then {
        $0.image = UIImage(named: "ic_menu")?.withRenderingMode(.alwaysTemplate)
        $0.tintColor = .gray200
        $0.contentMode = .scaleAspectFit
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Methods
    
    private func setupUI() {
        musicInfoStackView.addArrangedSubviews(musicTitleLabel, artistNameLabel)
        
        addSubviews(
            checkboxButton,
            albumImageView,
            musicInfoStackView,
            menuIconView
        )
        
        checkboxButton.addTarget(self, action: #selector(didTapCheckbox), for: .touchUpInside)
    }
    
    private func setupLayout() {
        
        checkboxButton.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.size.equalTo(24)
        }

        albumImageView.snp.makeConstraints {
            $0.centerY.equalTo(checkboxButton)
            $0.leading.equalTo(checkboxButton.snp.trailing).offset(10)
            $0.size.equalTo(42)
        }

        musicInfoStackView.snp.makeConstraints {
            $0.centerY.equalTo(checkboxButton)
            $0.leading.equalTo(albumImageView.snp.trailing).offset(10)
            $0.trailing.equalTo(menuIconView.snp.leading).offset(-19)
        }
        
        menuIconView.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalTo(checkboxButton)
            $0.size.equalTo(24)
        }
    }
    
    // MARK: - Actions
    
    @objc private func didTapCheckbox() {
        checkboxButton.isSelected.toggle()
    }

    // MARK: - Public Methods
    
    func setChecked(_ isSelected: Bool) {
        checkboxButton.isSelected = isSelected
    }
}
