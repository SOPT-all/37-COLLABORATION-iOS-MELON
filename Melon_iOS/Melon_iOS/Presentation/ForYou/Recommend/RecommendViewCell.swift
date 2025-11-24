//
//  RecommendViewCell.swift
//  Melon_iOS
//
//  Created by mandoo on 11/24/25.
//

import UIKit

import SnapKit
import Then
import Kingfisher

protocol RecommendViewCellDelegate: AnyObject {
    func chipTapped(in cell: RecommendViewCell)
}

final class RecommendViewCell: BaseUICollectionViewCell, ReuseIdentifiable {
    
    // MARK: - Properties
    
    weak var delegate: RecommendViewCellDelegate?
    
    // MARK: - UI Components
    
    private let chipButton = UIButton().then {
        $0.layer.cornerRadius = 24
        $0.clipsToBounds = true
    }
    
    private let artistImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = .imgToday
        $0.layer.cornerRadius = 18
        $0.clipsToBounds = true
        $0.isUserInteractionEnabled = false
    }
    
    private let contentLabel = UILabel().then {
        $0.font = .pretendard(.body_m_14)
        $0.textColor = .white
        $0.textAlignment = .center
        $0.isUserInteractionEnabled = false
    }
    
    private let contentStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = 8.0
        $0.isUserInteractionEnabled = false
    }
    
    // MARK: - Setup Methods
    
    override func setUI() {
        
        addSubviews(
            chipButton
        )
        
        chipButton.addSubviews(contentStackView)
        contentStackView.addArrangedSubviews(artistImageView, contentLabel)
        
        chipButton.addTarget(self, action: #selector(chipTapped), for: .touchUpInside)
        
        updateStyle(isSelected: false)
        updateLayout(hasImage: false)
    }
    
    override func setLayout() {
        chipButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(48)
        }
        
        artistImageView.snp.makeConstraints {
            $0.size.equalTo(36)
        }
        
        contentStackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    // MARK: - Actions
    
    @objc func chipTapped() {
        delegate?.chipTapped(in: self)
    }
}

// MARK: - Extensions

extension RecommendViewCell {
    
    private func updateStyle(isSelected: Bool) {
        if isSelected {
            chipButton.backgroundColor = .secondary
            chipButton.layer.borderWidth = 0
            contentLabel.textColor = .white
        } else {
            chipButton.backgroundColor = .none
            chipButton.layer.borderWidth = 0.3
            chipButton.layer.borderColor = UIColor.gray400.cgColor
            contentLabel.textColor = .gray100
        }
    }
    
    private func updateLayout(hasImage: Bool) {
        artistImageView.isHidden = !hasImage
        let leftSpace: CGFloat
        let rightSpace: CGFloat
        
        if hasImage {
            leftSpace = 4.0
            rightSpace = 12.0
        } else {
            leftSpace = 16.0
            rightSpace = 16.0
        }
        contentStackView.snp.remakeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(chipButton.snp.leading).offset(leftSpace)
            $0.trailing.equalTo(chipButton.snp.trailing).offset(-rightSpace)
        }
    }
    
    func configure(content: String, hasImage: Bool, isSelected: Bool) {
        contentLabel.text = content
        
        updateLayout(hasImage: hasImage)
        updateStyle(isSelected: isSelected)
    }
}
