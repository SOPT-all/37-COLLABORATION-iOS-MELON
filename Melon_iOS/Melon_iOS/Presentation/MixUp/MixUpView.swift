//
//  MixUpView.swift
//  Melon_iOS
//
//  Created by 조영서 on 11/15/25.
//

import UIKit

import SnapKit
import Then

final class MixUpView: BaseUIView {
    
    // MARK: - UI Components

    private let playlistLabel = UILabel().then {
        $0.text = "재생목록"
        $0.font = .pretendard(.heading_b_20)
        $0.textColor = .gray200
        $0.textAlignment = .center
    }

    private let drawerLabel = UILabel().then {
        $0.text = "음악서랍"
        $0.font = .pretendard(.heading_b_20)
        $0.textColor = .gray200
        $0.textAlignment = .center
    }

    private let mixupLabel = UILabel().then {
        $0.text = "믹스업"
        $0.font = .pretendard(.heading_b_20)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private let categoryStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = 16
    }
    
    private let searchIconView = UIImageView().then {
        $0.image = UIImage(named: "ic_search")?.withRenderingMode(.alwaysTemplate)
        $0.tintColor = .white
        $0.contentMode = .scaleAspectFit
    }

    private let chevronDownButton = UIButton().then {
        $0.setImage(UIImage(named: "ic_chevron_down")?.withRenderingMode(.alwaysTemplate), for: .normal)
        $0.tintColor = .white
        $0.contentMode = .scaleAspectFit
    }
    
    private let headerIconStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = 20
    }
    
    private let nowPlayingTitleLabel = UILabel().then {
        $0.text = "재생 중인 곡"
        $0.font = .pretendard(.body_sb_16)
        $0.textColor = .white
        $0.textAlignment = .left
    }
    
    private let addIconView = UIImageView().then {
        $0.image = UIImage(named: "ic_plus")?.withRenderingMode(.alwaysTemplate)
        $0.tintColor = .gray100
        $0.contentMode = .scaleAspectFit
    }
    
    private let addAllLabel = UILabel().then {
        $0.text = "전체담기"
        $0.font = .pretendard(.caption_r_12)
        $0.textColor = .gray100
        $0.textAlignment = .center
    }

    private let addAllContainerView = UIView().then {
        $0.backgroundColor = .clear
        $0.layer.borderWidth = 0.5
        $0.layer.borderColor = UIColor.gray300.cgColor
        $0.layer.cornerRadius = 4
        $0.layer.masksToBounds = true
    }
    
    private let checkboxButton = UIButton().then {
        $0.setImage(UIImage(named: "ic_checkbox_default"), for: .normal)
        $0.setImage(UIImage(named: "ic_checkbox_selected"), for: .selected)
        $0.tintColor = .gray200
        $0.contentMode = .scaleAspectFit
    }
    
    private let selectAllLabel = UILabel().then {
        $0.text = "전체선택"
        $0.font = .pretendard(.caption_r_12)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    let nowPlayingTrackView = NowPlayingTrackView()
    let mixUpListView = MixUpListView()
    let progressBar = ProgressBar(style: .mixup)

    // MARK: - Setup Methods
    
    override func setUI() {
                
        categoryStackView.addArrangedSubviews(playlistLabel, drawerLabel, mixupLabel)
        headerIconStackView.addArrangedSubviews(searchIconView, chevronDownButton)
        
        addSubviews(
            categoryStackView,
            headerIconStackView,
            nowPlayingTitleLabel,
            addIconView,
            addAllLabel,
            addAllContainerView,
            checkboxButton,
            selectAllLabel,
            nowPlayingTrackView,
            mixUpListView,
            progressBar
        )
        
        checkboxButton.addTarget(self, action: #selector(didTapCheckbox), for: .touchUpInside)
    }
    
    override func setLayout() {
        
        categoryStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(11)
            $0.leading.equalToSuperview().inset(20)
        }
        
        headerIconStackView.snp.makeConstraints {
            $0.centerY.equalTo(categoryStackView)
            $0.trailing.equalToSuperview().inset(25)
        }
        
        nowPlayingTitleLabel.snp.makeConstraints {
            $0.top.equalTo(categoryStackView.snp.bottom).offset(25)
            $0.leading.equalToSuperview().inset(20)
        }
        
        addAllContainerView.snp.makeConstraints {
            $0.centerY.equalTo(nowPlayingTitleLabel)
            $0.trailing.equalToSuperview().inset(20)
            $0.size.equalTo(CGSize(width: 72, height: 26))
        }
        
        addIconView.snp.makeConstraints {
            $0.centerY.equalTo(addAllContainerView)
            $0.leading.equalTo(addAllContainerView.snp.leading).offset(6)
            $0.size.equalTo(16)
        }
        
        addAllLabel.snp.makeConstraints {
            $0.centerY.equalTo(addAllContainerView)
            $0.trailing.equalTo(addAllContainerView.snp.trailing).offset(-6)
        }
        
        checkboxButton.snp.makeConstraints {
            $0.top.equalTo(nowPlayingTitleLabel.snp.bottom).offset(17)
            $0.leading.equalToSuperview().inset(20)
            $0.size.equalTo(24)
        }
        
        selectAllLabel.snp.makeConstraints {
            $0.centerY.equalTo(checkboxButton)
            $0.leading.equalTo(checkboxButton.snp.trailing).offset(4)
        }
        
        nowPlayingTrackView.snp.makeConstraints {
            $0.top.equalTo(checkboxButton.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(42)
        }
        
        mixUpListView.snp.makeConstraints {
            $0.top.equalTo(nowPlayingTrackView.snp.bottom).offset(24)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalTo(progressBar.snp.top)
        }
        
        progressBar.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide)
            $0.height.equalTo(81)
        }
        
        [searchIconView, chevronDownButton].forEach {
            $0.snp.makeConstraints { $0.size.equalTo(24) }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.gradient3()
    }
    
    // MARK: - Actions

    @objc private func didTapCheckbox() {
        checkboxButton.isSelected.toggle()
    }
}
