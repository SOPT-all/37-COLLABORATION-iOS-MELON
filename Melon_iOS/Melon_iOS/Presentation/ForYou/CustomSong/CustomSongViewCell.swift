//
//  CustomSongViewCell.swift
//  Melon_iOS
//
//  Created by mandoo on 11/24/25.
//

import UIKit

import SnapKit
import Then
import Kingfisher

protocol CustomSongViewCellDelegate: AnyObject {
    func mixUpButtonTapped(in cell: CustomSongViewCell)
}

final class CustomSongViewCell: BaseUICollectionViewCell, ReuseIdentifiable {
    
    // MARK: - Properties
    
    weak var delegate: CustomSongViewCellDelegate?
    
    // MARK: - UI Components
    
    private let albumImageView = UIImageView().then {
        $0.layer.cornerRadius = 4
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
    }
    
    private let songStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .leading
    }
    
    private let contentLabel = UILabel().then {
        $0.font = .pretendard(.caption_r_12)
        $0.textColor = .gray200
        $0.textAlignment = .center
    }
    
    private let songLabel = UILabel().then {
        $0.font = .pretendard(.body_r_14)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private let artistLabel = UILabel().then {
        $0.font = .pretendard(.caption_r_12)
        $0.textColor = .gray200
        $0.textAlignment = .center
    }
    
    private let mixUpButton = UIButton().then {
        $0.setImage(.icMixup36, for: .normal)
    }
    
    // MARK: - Setup Methods
    
    override func setUI() {
        
        songStackView.addArrangedSubviews(contentLabel, songLabel, artistLabel)
        
        contentView.addSubviews(
            albumImageView,
            songStackView,
            mixUpButton,
        )
        
        mixUpButton.addTarget(self, action: #selector(mixUpButtonTapped), for: .touchUpInside)
    }
    
    override func setLayout() {
        
        albumImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.size.equalTo(56)
        }
        
        songStackView.snp.makeConstraints {
            $0.leading.equalTo(albumImageView.snp.trailing).offset(10)
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(mixUpButton.snp.leading).inset(27)
        }
        
        mixUpButton.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    // MARK: - Actions
    
    @objc private func mixUpButtonTapped() {
        delegate?.mixUpButtonTapped(in: self)
    }
}

// MARK: - Extensions

extension CustomSongViewCell {
    func configure(title: String, artist: String, imageUrl: String?, itemIndex: Int) {
        songLabel.text = title
        artistLabel.text = artist
        
        switch itemIndex {
        case 0:
            contentLabel.text = "내 취향곡"
        case 1:
            contentLabel.text = "최근들은 플리"
        case 2:
            contentLabel.text = "내가 찾던 그곡"
        default:
            contentLabel.text = nil
        }
        
        if let imageUrl,
           let _ = URL(string: imageUrl) {
            albumImageView.kf.setImage(
                with: URL(string: imageUrl),
                placeholder: UIImage(named: "img_mixup_default")
            )
        } else {
            albumImageView.image = UIImage(named: "img_mixup_default")
        }
    }
}
