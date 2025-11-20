//
//  CTAButton.swift
//  Melon_iOS
//
//  Created by mandoo on 11/19/25.
//

import UIKit

import SnapKit
import Then

final class CTAButton: UIButton {
    
    // MARK: - Properties
    
    enum ButtonStyle {
        case filledWhite
        case filledBlack
        case bordered
    }
    
    private let buttonStyle: ButtonStyle
    private let font: UIFont
    private let image: UIImage?
    private let imageTextSpacing: CGFloat?
    private var action: (() -> Void)?
    
    // MARK: - Init
    
    init(style: ButtonStyle, label: String, font: UIFont, image: UIImage? = nil, imageTextSpacing: CGFloat? = nil,
         action: (() -> Void)? = nil) {
        self.buttonStyle = style
        self.font = font
        self.image = image
        self.imageTextSpacing = imageTextSpacing
        self.action = action
        
        super.init(frame: .zero)
        
        configure(label: label)
        
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Methods
    
    private func setLayout(style: ButtonStyle) {
        switch style {
        case .filledBlack:
            snp.makeConstraints {
                $0.height.equalTo(44)
            }
        case .bordered, .filledWhite:
            snp.makeConstraints {
                $0.height.equalTo(42)
            }
        }
    }
    
    private func configure(label: String) {
        var config = UIButton.Configuration.filled()
        var attributedLabel = AttributedString(label)
        
        attributedLabel.font = font
        config.attributedTitle = attributedLabel
        config.image = image
        config.imagePadding = imageTextSpacing ?? 0
        config.imagePlacement = .leading
        config.background.cornerRadius = 4
        
        switch buttonStyle {
        case .filledWhite:
            config.baseBackgroundColor = .white
            config.baseForegroundColor = .background
            
        case .filledBlack:
            config.baseBackgroundColor = .background
            config.baseForegroundColor = .white
            
        case .bordered:
            config.baseBackgroundColor = .clear
            config.baseForegroundColor = .white
            config.background.strokeWidth = 0.3
            config.background.strokeColor = .gray200
        }
        self.configuration = config
    }
    
    // MARK: - Actions
    
    @objc func buttonTapped() {
        action?()
        
        if buttonStyle == .filledBlack {
            isSelected.toggle()
        }
    }
}
