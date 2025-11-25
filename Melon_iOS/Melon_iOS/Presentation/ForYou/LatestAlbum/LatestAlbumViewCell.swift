//
//  LatestAlbumViewCell.swift
//  Melon_iOS
//
//  Created by mandoo on 11/25/25.
//
import UIKit

import SnapKit
import Then
import Kingfisher

final class LatestAlbumViewCell: BaseUITableViewCell {
    
    // MARK: - Properties
    
    static let identifier: String = "LatestAlbumViewCell"
    
    // MARK: - UI Components
    
    private let songImageView = UIImageView().then {
        $0.layer.cornerRadius = 4
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
    }
    
    private let songLabel = UILabel().then {
        $0.font = .pretendard(.body_r_14)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private let artistLabel = UILabel().then {
        $0.font = .pretendard(.body_r_14)
        $0.textColor = .opacity1
        $0.textAlignment = .center
    }
    
    private let titleChipView = UIView().then {
        $0.layer.borderColor = UIColor.primary.cgColor
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.clipsToBounds = true
    }
    
    private let titleChipLabel = UILabel().then {
        $0.text = "TITLE"
        $0.font = .pretendard(.caption_sb_8)
        $0.textColor = .primary
        $0.textAlignment = .center
    }
    
    // MARK: - Setup Methods
    
    override func setUI() {
        contentView.addSubviews(songImageView, titleChipView, songLabel, artistLabel)
        titleChipView.addSubview(titleChipLabel)
        
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        self.selectionStyle = .none
    }
    
    override func setLayout() {
        
        songImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
            $0.size.equalTo(31)
            $0.bottom.equalToSuperview().inset(10)
        }
        
        titleChipView.snp.makeConstraints {
            $0.leading.equalTo(songImageView.snp.trailing).offset(8)
            $0.centerY.equalTo(songImageView)
            $0.height.equalTo(15)
        }
        
        titleChipLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(3.5)
            $0.centerY.equalTo(titleChipView)
        }
        
        songLabel.snp.makeConstraints {
            $0.leading.equalTo(titleChipView.snp.trailing).offset(4)
            $0.centerY.equalTo(songImageView)
        }
        
        artistLabel.snp.makeConstraints {
            $0.leading.equalTo(songLabel.snp.trailing).offset(4)
            $0.centerY.equalTo(songImageView)
        }
    }
}

// MARK: - Extensions

extension LatestAlbumViewCell {
    func configure(title: String, artistName: String, imageUrl: String?, isTitleTrack: Bool) {
        songLabel.text = title
        artistLabel.text = artistName
        
        titleChipView.isHidden = !isTitleTrack
        
        if isTitleTrack {
            songLabel.textColor = .primary
            artistLabel.textColor = .primary
            songLabel.font = .pretendard(.body_b_14)
            songLabel.snp.remakeConstraints {
                $0.leading.equalTo(titleChipView.snp.trailing).offset(4)
                $0.centerY.equalTo(songImageView)
            }
        } else {
            songLabel.textColor = .white
            artistLabel.textColor = .opacity1
            songLabel.snp.remakeConstraints {
                $0.leading.equalTo(songImageView.snp.trailing).offset(8)
                $0.centerY.equalTo(songImageView)
            }
        }
        
        if let imageUrl,
           let _ = URL(string: imageUrl) {
            songImageView.kf.setImage(
                with: URL(string: imageUrl),
                placeholder: UIImage(named: "img_mixup_default")
            )
        } else {
            songImageView.image = UIImage(named: "img_mixup_default")
        }
    }
}

