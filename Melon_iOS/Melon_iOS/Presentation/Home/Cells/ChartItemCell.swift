//
//  ChartItemCell.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/19/25.
//

import UIKit

import SnapKit
import Then

final class ChartItemCell: BaseUICollectionViewCell, ReuseIdentifiable {
    
    // MARK: - UI Components
    
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.backgroundColor = .background2
        $0.layer.cornerRadius = 4
    }
    
    private let rankStack = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = 4
    }
    
    private let rankLabel = UILabel().then {
        $0.font = UIFont.pretendard(.body_r_14)
        $0.textColor = .white
    }
    
    private let rankChangeLabel = UILabel().then {
        $0.font = UIFont.pretendard(.caption_r_12)
        $0.textColor = .gray300
        $0.text = "-"
    }
    
    private let infoStack = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.spacing = 4
    }
    
    private let titleLabel = UILabel().then {
        $0.font = UIFont.pretendard(.body_r_14)
        $0.textColor = .white
        $0.numberOfLines = 1
    }
    
    private let artistLabel = UILabel().then {
        $0.font = UIFont.pretendard(.caption_r_12)
        $0.textColor = .gray200
        $0.numberOfLines = 1
    }
    
    private let playButton = UIButton().then {
        $0.contentMode = .scaleAspectFit
        $0.setImage(.icPlay24, for: .normal)
        $0.setImage(.icPause24, for: .selected)
    }
    
    // MARK: - Setup Methods
    
    override func setUI() {
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        
        addSubviews(imageView, playButton, rankStack, infoStack,)
        
        rankStack.addArrangedSubviews(rankLabel, rankChangeLabel)
        infoStack.addArrangedSubviews(titleLabel, artistLabel)
    }
    
    override func setLayout() {
        imageView.snp.makeConstraints {
            $0.leading.verticalEdges.equalToSuperview()
            $0.width.equalTo(imageView.snp.height)
        }
        
        rankStack.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(imageView.snp.trailing)
            $0.width.equalTo(40)
        }
        
        infoStack.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(rankStack.snp.trailing)
            $0.trailing.equalTo(playButton.snp.leading).offset(-25)
        }
        
        playButton.snp.makeConstraints {
            $0.size.equalTo(24)
            $0.centerY.trailing.equalToSuperview()
        }
    }
    
    // MARK: - Actions
    
    @objc private func playButtonTapped() {
        playButton.isSelected.toggle()
    }
    
    func configure(_ data: ChartSongDTO, row rank: Int = -1) {
        rankLabel.text = "\(rank + 1)"
        titleLabel.text = data.title
        artistLabel.text = data.artistName
        
        if let imageUrl = data.imageUrl, let url = URL(string: imageUrl) {
            imageView.kf.setImage(
                with: url
            )} else {
                imageView.image = .none
            }
    }
}
