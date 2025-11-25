//
//  LatestAlbumView.swift
//  Melon_iOS
//
//  Created by mandoo on 11/25/25.
//

import UIKit

import SnapKit
import Then

protocol LatestAlbumViewDelegate: AnyObject {
    func mixUpButtonTapped()
}

final class LatestAlbumView: BaseUIView {
    
    // MARK: - Properties
    
    weak var delegate: LatestAlbumViewDelegate?
    
    // MARK: - UI Components
    
    private let albumNameLabel = UILabel().then {
        $0.font = .pretendard(.heading_b_20)
        $0.textColor = .white
        $0.textAlignment = .left
        $0.numberOfLines = 2
    }
    
    private let coverImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    private let albumImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 8
    }
    
    let tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        
        tv.register(LatestAlbumViewCell.self, forCellReuseIdentifier: LatestAlbumViewCell.identifier)
        
        tv.separatorStyle = .none
        tv.isScrollEnabled = false
        tv.backgroundColor = .clear
        tv.rowHeight = 41
        
        return tv
    }()
    
    private lazy var listenSampleButton = CTAButton(
        style: .bordered,
        label: "미리듣기",
        font: .pretendard(.body_r_14),
        image: .icPreview,
        imageSize: 24,
        imageTextSpacing: 4
    )
    
    private lazy var mixUpButton = CTAButton(
        style: .filledWhite,
        label: "믹스업",
        font: .pretendard(.body_r_14),
        image: .icMixup32,
        imageSize: 32,
        imageTextSpacing: 3,
        action: { [weak self] in
            self?.delegate?.mixUpButtonTapped()
        }
    )
    
    private let buttonStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 11
    }
    
    // MARK: - Setup Methods
    
    override func setUI() {
        
        buttonStackView.addArrangedSubviews(listenSampleButton, mixUpButton)
        
        addSubviews(
            coverImageView,
            albumNameLabel,
            albumImageView,
            tableView,
            buttonStackView
        )
        
        layer.cornerRadius = 8
        clipsToBounds = true
    }
    
    override func setLayout() {
        
        coverImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        buttonStackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview().inset(12)
        }
        
        albumNameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(12)
            $0.top.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview().inset(38)
        }
        
        albumImageView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(83)
            $0.top.equalTo(albumNameLabel.snp.bottom).offset(11)
            $0.size.equalTo(169)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(albumImageView.snp.top).offset(136)
            $0.horizontalEdges.equalToSuperview().inset(12)
            $0.bottom.equalTo(buttonStackView.snp.top)
        }
    }
}

extension LatestAlbumView {
    func configure(title: String, coverUrl: String?, albumUrl: String?) {
        albumNameLabel.text = title
        
        if let coverUrl,
           let _ = URL(string: coverUrl) {
            coverImageView.kf.setImage(
                with: URL(string: coverUrl),
                placeholder: UIImage(named: "Img_album_background")
            )
        } else {
            coverImageView.image = UIImage(named: "Img_album_background")
        }
        
        if let albumUrl,
           let _ = URL(string: albumUrl) {
            albumImageView.kf.setImage(
                with: URL(string: albumUrl),
                placeholder: UIImage(named: "img_fan_1")
            )
        } else {
            albumImageView.image = UIImage(named: "img_fan_1")
        }
    }
}
