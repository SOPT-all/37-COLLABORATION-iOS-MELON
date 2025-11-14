//
//  BaseUIView.swift
//  Melon_iOS
//
//  Created by 조영서 on 11/15/25.
//

import UIKit

class BaseUIView: UIView {

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup Methods

    func setUI() {}
    func setLayout() {}
}
